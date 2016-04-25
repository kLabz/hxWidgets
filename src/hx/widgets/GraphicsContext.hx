package hx.widgets;

import wx.widgets.GraphicsContext in WxGraphicsContext;

class GraphicsContext {
    private var _ref:WxGraphicsContext;
    
    @:access(hx.widgets.Window)
    public function new(window:Window = null) {
        if (window != null) {
            _ref = WxGraphicsContext.createInstance(window._ref);
        }
    }
    
    public function strokeLine(x1:Float, y1:Float, x2:Float, y2:Float) {
        _ref.strokeLine(x1, y1, x2, y2);
    }

    @:access(hx.widgets.Pen)
    public function setPen(pen:Pen):Void {
        _ref.setPen(pen._ref);
    }
    
    @:access(hx.widgets.Brush)
    public function setBrush(brush:Brush):Void {
        _ref.setBrush(brush._ref);
    }
    
    @:access(hx.widgets.Font)
    @:access(hx.widgets.Colour)
    public function setFont(font:Font, color:Int = 0):Void {
        var c:Colour = new Colour(color);
        _ref.setFont(font._ref, c._ref);
    }
    
    public function drawText(text:String, x:Float, y:Float):Void {
        _ref.drawText(text, x, y);
    }
    
    public function drawRoundedRectangle(x:Float, y:Float, width:Float, height:Float, radius:Float):Void {
        _ref.drawRoundedRectangle(x, y, width, height, radius);
    }
    
    @:access(hx.widgets.Bitmap)
    public function drawBitmap(bmp:Bitmap, x:Float = 0, y:Float = 0, width:Float = -1, height:Float = -1):Void {
        if (width == -1) {
            width = bmp.getWidth();
        }
        if (height == -1) {
            height = bmp.getHeight();
        }
        _ref.drawBitmap(bmp._ref, x, y, width, height);
    }
    
    public function setAnitaliasMode(mode:AntialiasMode):Bool {
        return _ref.setAntialiasMode(#if (haxe_ver >= 3.3) mode #else untyped __cpp__("((wxAntialiasMode)mode)")#end);
    }
    
    public function setInterpolationQuality(mode:InterpolationQuality):Bool {
        return _ref.setInterpolationQuality(#if (haxe_ver >= 3.3) mode #else untyped __cpp__("((wxInterpolationQuality)mode)")#end);
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    // STATIC HELPERS
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    @:access(hx.widgets.WindowDC)
    public static function fromWindowDC(dc:WindowDC):GraphicsContext {
        var ctx:GraphicsContext = new GraphicsContext();
        ctx._ref = WxGraphicsContext.createInstanceFromWindowDC(dc.windowDCRef);
        return ctx;
    }
    
    @:access(hx.widgets.MemoryDC)
    public static function fromMemoryDC(dc:MemoryDC):GraphicsContext {
        var ctx:GraphicsContext = new GraphicsContext();
        ctx._ref = WxGraphicsContext.createInstanceFromMemoryDC(dc.memoryDCRef);
        return ctx;
    }
}