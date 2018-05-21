<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Exceptions\UnauthorizedException;

class RoleMiddleware
{
    public function handle($request, Closure $next, $role)
    {
        if (Auth::guard('admin')->guest()) {
            if($request->path() != 'admin/login'){
                return redirect('admin/login');
            }
            //return redirect('admin/login');
            //throw UnauthorizedException::notLoggedIn();
        }
        if ($role != '*') {
            $roles = is_array($role)
            ? $role
            : explode('|', $role);

            if (!Auth::guard('admin')->user()->hasAnyRole($roles)) {
                //Auth::guard('admin')->logout();
                //return redirect('admin/login');
                throw UnauthorizedException::forRoles($roles);
            }
        }
        return $next($request);
    }
}
