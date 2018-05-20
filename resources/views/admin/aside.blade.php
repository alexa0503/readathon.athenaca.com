<aside class="sidebar-menu fixed">
    <div class="sidebar-inner scrollable-sidebar">
        <div class="main-menu">
            <ul class="accordion">
                <li class="menu-header">
                    Main Menu
                </li>
                @include('admin.menu-items', array('items' => $menu->roots()))
            </ul>
        </div>
        <!--<div class="sidebar-fix-bottom clearfix">
            <div class="user-dropdown dropup pull-left">
                <a href="#" class="dropdwon-toggle font-18" data-toggle="dropdown"><i class="ion-person-add"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#">
                            Inbox
                            <span class="badge badge-danger bounceIn animation-delay2 pull-right">1</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            Notification
                            <span class="badge badge-purple bounceIn animation-delay3 pull-right">2</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="sidebarRight-toggle">
                            Message
                            <span class="badge badge-success bounceIn animation-delay4 pull-right">7</span>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">Setting</a>
                    </li>
                </ul>
            </div>
            <a href="lockscreen.html" class="pull-right font-18"><i class="ion-log-out"></i></a>
        </div>-->
    </div><!-- sidebar-inner -->
</aside>