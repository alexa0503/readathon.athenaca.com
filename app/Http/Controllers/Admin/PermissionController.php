<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Validator;

class PermissionController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:管理员','permission:权限管理']) || $this->middleware(['role:超级管理员']);
    }
    public function index()
    {
        $admins = \App\Administrator::paginate(20);
        foreach ($admins as $admin) {
            $admin->role_names = implode(',', $admin->getRoleNames()->toArray());
            $permission_names = [];
            foreach ($admin->getAllPermissions() as $permission) {
                $permission_names[] = $permission->name;
            }
            $admin->permission_names = implode(',', $permission_names);
        }
        //dd($admins);
        return view('admin.permission.index', ['items' => $admins]);
    }
    public function create()
    {
        return view('admin.permission.create', [
            'permissions' => Permission::all(),
        ]);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:administrators|max:255',
            'email' => 'required|email|unique:administrators',
            'password' => 'required',
            'role' => 'required',
            'permission' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $admin = new \App\Administrator;
        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->password = bcrypt($request->password);
        $admin->save();

        foreach ($request->role as $role) {
            $_role = Role::where('name', $role)->where('guard_name', 'admin')->select('id')->first();
            if( null == $_role){
                Role::create(['guard_name' => 'admin', 'name' => $role]);
            }
        }
        $admin->syncRoles($request->role);
        $admin->syncPermissions($request->permission);
        return response()->json(['ret' => 0, 'url' => route('permission.index')]);

    }
    public function edit($id)
    {
        $admin = \App\Administrator::find($id);

        $permission_names = [];
        foreach ($admin->getAllPermissions() as $permission) {
            $permission_names[] = $permission->name;
        }
        return view('admin.permission.edit',[
            'admin' => $admin,
            'permissions' => Permission::all(),
            'role_names' => $admin->getRoleNames()->toArray(),
            'permission_names' => $permission_names,
        ]);
    }
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:administrators,name,'.$id.'|max:255',
            'email' => 'required|email|unique:administrators,email,'.$id,
            'role' => 'required',
            'permission' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $admin = \App\Administrator::find($id);
        $admin->name = $request->name;
        $admin->email = $request->email;
        if( $request->_password != null ){
            $admin->password = bcrypt($request->_password);
        }
        $admin->save();
        $admin->syncRoles($request->role);
        $admin->syncPermissions($request->permission);
        return response()->json(['ret' => 0, 'url' => route('permission.index')]);

    }
    public function destroy($id)
    {
        $admin = \App\Administrator::find($id);
        $admin->delete();
        return ['ret'=>0];
    }
}
