<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use App\Post;
use App\Page;
class PostController extends Controller
{
    
    public function __construct()
    {
        $this->middleware(['role:管理员','permission:页面管理']) || $this->middleware(['role:超级管理员']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $id)
    {
        $block_type = $request->input('block_type');
        if( null == $block_type ){
            return redirect(route('page.post.index',['page'=>$id,'block_type'=>'slides']));
        }
        if($id == 'common'){
            $orm = Post::whereNull('page_id');
        }
        else{
            $orm = Post::where('page_id', $id);
        }
        $orm->where('block_type',$block_type);
        $posts = $orm->orderBy('sort_id', 'ASC')->paginate(20);
        $page = Page::find($id);
        return view('admin.post.index',[
            'items' => $posts,
            'page' => $page
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, $page)
    {
        
        return view('admin.post.create', [
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $page)
    {
        $post = new Post;
        $messages = [
            'title.*' => '请输入标题~',
            'sort_id.required' => '请输入排序ID~',
            'sort_id.numeric' => '排序ID必须为大于等于1的整数~',
            'sort_id.min' => '排序ID必须为大于等于1的整数~',
            'sort_id.max' => '排序ID必须为大于等于1的整数~',
        ];
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'sort_id' => 'required|numeric|min:1|max:99999000',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $post->title = $request->input('title');
        $post->page_id = $page;
        $post->link = $request->input('link') ?: '';
        $post->sort_id = $request->input('sort_id') ?: 999;
        $post->block_type = $request->input('block_type');
        $post->image = $request->input('image') ?: '';
        $post->body = $request->input('body') ?: '';
        $post->save();
        return response()->json(['ret' => 0, 'url' => route('page.post.index', ['page'=>$page])]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $page, $id)
    {
        //$id = $request->input('id');
        $post = Post::find($id);
        return view('admin.post.edit', [
            'item' => $post
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $page, $id)
    {
        $post = Post::find($id);
        $messages = [
            'title.*' => '请输入标题~',
            'sort_id.required' => '请输入排序ID~',
            'sort_id.numeric' => '排序ID必须为大于等于1的整数~',
            'sort_id.min' => '排序ID必须为大于等于1的整数~',
            'sort_id.max' => '排序ID必须为大于等于1的整数~',
        ];
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'sort_id' => 'required|numeric|min:1|max:99999000',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $post->title = $request->input('title');
        $post->link = $request->input('link') ?: '';
        $post->image = $request->input('image') ?: '';
        $post->sort_id = $request->input('sort_id') ?: 999;
        $post->body = $request->input('body') ?: '';
        $post->save();
        return response()->json(['ret' => 0, 'url' => route('page.post.index', ['page'=>$page])]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
