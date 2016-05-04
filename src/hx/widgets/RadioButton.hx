package hx.widgets;

import cpp.Pointer;
import wx.widgets.RadioButton in WxRadioButton;

class RadioButton extends Control {
    public function new(parent:Window, label:String, style:Int = 0, id:Int = -1) {
        if (_ref == null) {
            _ref = WxRadioButton.createInstance();
            radioButtonRef.ptr.create(Window.toRaw(parent), id, label, Point.defaultPosition.ref, Size.defaultSize.ref, style);
        }
        
        super(parent, id);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Instance functions
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var value(get, set):Bool;
    private function get_value():Bool {
        return radioButtonRef.ptr.getValue();
    }
    private function set_value(value:Bool):Bool {
        radioButtonRef.ptr.setValue(value);
        return value;
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Helpers
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    private var radioButtonRef(get, null):Pointer<WxRadioButton>;
    private function get_radioButtonRef():Pointer<WxRadioButton> {
        return Pointer.fromRaw(untyped __cpp__("(wxRadioButton*)(_ref->get_raw())"));
    }
}
