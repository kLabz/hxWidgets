package hx.widgets;

import cpp.Pointer;
import wx.widgets.MenuBar in WxMenuBar;

class MenuBar extends Window { 
    public function new(style:Int = 0, create:Bool = true) {
        super(null, -1);
        if (create == true) {
            _ref = WxMenuBar.createInstance(style);
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Instance functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:access(hx.widgets.Menu)
    public function append(menu:Menu, title:String) {
        menuBarRef.ptr.append(menu.menuRef.get_raw(), title);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    private var menuBarRef(get, null):Pointer<WxMenuBar>;
    private function get_menuBarRef():Pointer<WxMenuBar> {
        return Pointer.fromRaw(untyped __cpp__("(wxMenuBar*)(_ref->get_raw())"));
    }
}
