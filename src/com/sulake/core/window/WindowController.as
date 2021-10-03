package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.MouseListenerType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowDisposeEvent;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowEventDispatcher;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.services.IMouseListenerService;
   import com.sulake.core.window.utils.DefaultAttStruct;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class WindowController extends WindowModel implements IWindow, IGraphicContextHost
   {
      
      private static var var_1217:uint = 0;
      
      protected static const TAG_EXCLUDE:String = "_EXCLUDE";
      
      protected static const TAG_INTERNAL:String = "_INTERNAL";
      
      protected static const const_1299:String = "_COLORIZE";
      
      protected static const const_1298:String = "_IGNORE_INHERITED_STYLE";
      
      private static const const_1032:Point = new Point();
       
      
      protected var _events:WindowEventDispatcher;
      
      protected var var_21:IGraphicContext;
      
      protected var var_695:Function;
      
      protected var var_175:Boolean = true;
      
      protected var _parent:WindowController;
      
      protected var _children:Array;
      
      protected var _debug:Boolean = false;
      
      private var var_1218:Boolean = false;
      
      private var var_366:Rectangle;
      
      private var var_2541:uint;
      
      public function WindowController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var _loc14_:* = 0;
         this.var_2541 = var_1217++;
         var _loc12_:XML = param5.getWindowFactory().getLayoutByTypeAndStyle(param2,param3);
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,!!_loc12_ ? Number(int(_loc12_.attribute("width"))) : Number(10),!!_loc12_ ? Number(int(_loc12_.attribute("height"))) : Number(10));
         }
         super(param11,param1,param2,param3,param4,param5,param6,param10);
         if(!this.var_21)
         {
            this.var_21 = this.getGraphicContext(!testParamFlag(WindowParam.const_33));
         }
         this._events = new WindowEventDispatcher(this);
         this._children = new Array();
         this.var_366 = new Rectangle();
         if(_loc12_ != null)
         {
            var_401 = new Rectangle(0,0,int(_loc12_.attribute("width")),int(_loc12_.attribute("height")));
            var_64 = var_401.clone();
            var_11 = var_401.clone();
            param5.getWindowParser().parseAndConstruct(_loc12_,this,null);
            _loc14_ = uint(var_19);
            var_19 &= -1;
            this.setRectangle(param6.x,param6.y,param6.width,param6.height);
            var_19 = _loc14_;
            var_64.x = param6.x;
            var_64.y = param6.y;
            var_64.width = param6.width;
            var_64.height = param6.height;
         }
         var _loc13_:DefaultAttStruct = param5.getWindowFactory().getDefaultsByTypeAndStyle(param2,param3);
         if(_loc13_)
         {
            var_705 = _loc13_.blend;
            var_472 = _loc13_.var_2893;
            if(var_473 != _loc13_.background)
            {
               this.background = _loc13_.background;
            }
            if(var_240 != _loc13_.color)
            {
               this.color = _loc13_.color;
            }
            if(_loc13_.hasRectLimits())
            {
               var_74.assign(_loc13_.width_min,_loc13_.width_max,_loc13_.height_min,_loc13_.height_max);
            }
         }
         if(param9)
         {
            this.properties = param9;
         }
         this.var_695 = param8;
         if(param7 != null)
         {
            this._parent = param7 as WindowController;
            WindowController(param7).addChild(this);
            if(this.var_21)
            {
               _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
            }
         }
      }
      
      private static function calculateMouseRegion(param1:WindowController, param2:Rectangle) : void
      {
         var _loc3_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc3_);
         var _loc4_:int = param1.numChildren;
         var _loc5_:int = _loc3_.x;
         var _loc6_:int = _loc3_.y;
         param2.left = _loc5_ < param2.left ? Number(_loc5_) : Number(param2.left);
         param2.top = _loc6_ < param2.top ? Number(_loc6_) : Number(param2.top);
         param2.right = _loc3_.right > param2.right ? Number(_loc3_.right) : Number(param2.right);
         param2.bottom = _loc3_.bottom > param2.bottom ? Number(_loc3_.bottom) : Number(param2.bottom);
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            WindowController.calculateMouseRegion(param1.getChildAt(_loc7_) as WindowController,param2);
            _loc7_++;
         }
      }
      
      public static function expandToAccommodateChild(param1:WindowController, param2:IWindow) : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.width;
         var _loc6_:int = param1.height;
         var _loc7_:Rectangle = param2.rectangle.clone();
         var _loc8_:Boolean = false;
         if(_loc7_.x < 0)
         {
            _loc3_ = _loc7_.x;
            _loc5_ -= _loc3_;
            _loc7_.x = 0;
            _loc8_ = true;
         }
         if(_loc7_.right > _loc5_)
         {
            _loc5_ = _loc7_.x + _loc7_.width;
            _loc8_ = true;
         }
         if(_loc7_.y < 0)
         {
            _loc4_ = _loc7_.y;
            _loc6_ -= _loc4_;
            _loc7_.y = 0;
            _loc8_ = true;
         }
         if(_loc7_.bottom > _loc6_)
         {
            _loc6_ = _loc7_.y + _loc7_.height;
            _loc8_ = true;
         }
         if(_loc8_)
         {
            _loc9_ = param1.getParamFlag(WindowParam.const_71);
            param1.setParamFlag(WindowParam.const_71,false);
            param1.setRectangle(param1.x + _loc3_,param1.y + _loc4_,_loc5_,_loc6_);
            if(_loc4_ != 0 || _loc3_ != 0)
            {
               _loc11_ = uint(param1.numChildren);
               _loc10_ = 0;
               while(_loc10_ < _loc11_)
               {
                  IWindow(param1.getChildAt(_loc10_)).offset(-_loc3_,-_loc4_);
                  _loc10_++;
               }
            }
            if(_loc9_)
            {
               param1.setParamFlag(WindowParam.const_71,true);
            }
         }
      }
      
      public static function resizeToAccommodateChildren(param1:WindowController, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc8_:* = null;
         var _loc12_:Boolean = false;
         var _loc4_:int = !!param2 ? 0 : 0;
         var _loc5_:int = !!param2 ? 0 : 0;
         var _loc6_:int = !!param2 ? 0 : 0;
         var _loc7_:int = !!param2 ? 0 : 0;
         var _loc9_:Boolean = false;
         var _loc10_:uint = param1.numChildren;
         var _loc11_:Boolean = param1.getParamFlag(WindowParam.const_71);
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc10_)
            {
               _loc8_ = param1.getChildAt(_loc3_).rectangle;
               if(_loc8_.x < _loc4_)
               {
                  _loc4_ = _loc8_.x;
                  _loc9_ = true;
               }
               if(_loc8_.right > _loc6_)
               {
                  _loc6_ = _loc8_.right;
                  _loc9_ = true;
               }
               if(_loc8_.y < _loc5_)
               {
                  _loc5_ = _loc8_.y;
                  _loc9_ = true;
               }
               if(_loc8_.bottom > _loc7_)
               {
                  _loc7_ = _loc8_.bottom;
                  _loc9_ = true;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc10_)
            {
               _loc8_ = param1.getChildAt(_loc3_).rectangle;
               if(_loc8_.x < _loc4_)
               {
                  _loc4_ = _loc8_.x;
                  _loc9_ = true;
               }
               if(_loc8_.right > _loc6_)
               {
                  _loc6_ = _loc8_.right;
                  _loc9_ = true;
               }
               if(_loc8_.y < _loc5_)
               {
                  _loc5_ = _loc8_.y;
                  _loc9_ = true;
               }
               if(_loc8_.bottom > _loc7_)
               {
                  _loc7_ = _loc8_.bottom;
                  _loc9_ = true;
               }
               _loc3_++;
            }
         }
         if(_loc9_)
         {
            if(_loc11_)
            {
               param1.setParamFlag(WindowParam.const_71,false);
            }
            if(param2)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc10_)
               {
                  _loc12_ = param1.testParamFlag(WindowParam.const_101);
                  if(_loc12_)
                  {
                     param1.setParamFlag(WindowParam.const_101,false);
                  }
                  param1.offset(-_loc4_,-_loc5_);
                  if(_loc12_)
                  {
                     param1.setParamFlag(WindowParam.const_101,true);
                  }
                  _loc3_++;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < _loc10_)
               {
                  param1.getChildAt(_loc3_).offset(-_loc4_,-_loc5_);
                  _loc3_++;
               }
            }
            param1.setRectangle(param1.x + _loc4_,param1.y + _loc5_,!!param2 ? int(_loc6_ - _loc4_) : int(_loc6_),!!param2 ? int(_loc7_ - _loc5_) : int(_loc7_));
            if(_loc11_)
            {
               param1.setParamFlag(WindowParam.const_71,true);
            }
         }
      }
      
      public function get properties() : Array
      {
         return new Array();
      }
      
      public function get procedure() : Function
      {
         return this.var_695 != null ? this.var_695 : (this._parent != null ? this._parent.procedure : this.nullEventProc);
      }
      
      public function get filters() : Array
      {
         return !!this.hasGraphicsContext() ? this.getGraphicContext(true).filters : [];
      }
      
      public function get parent() : IWindow
      {
         return this._parent;
      }
      
      public function get debug() : Boolean
      {
         return this._debug;
      }
      
      public function set x(param1:int) : void
      {
         if(param1 != var_11.x)
         {
            this.setRectangle(param1,var_11.y,var_11.width,var_11.height);
         }
      }
      
      public function set y(param1:int) : void
      {
         if(param1 != var_11.y)
         {
            this.setRectangle(var_11.x,param1,var_11.width,var_11.height);
         }
      }
      
      public function set id(param1:uint) : void
      {
         _id = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set width(param1:int) : void
      {
         if(param1 != var_11.width)
         {
            this.setRectangle(var_11.x,var_11.y,param1,var_11.height);
         }
      }
      
      public function set height(param1:int) : void
      {
         if(param1 != var_11.height)
         {
            this.setRectangle(var_11.x,var_11.y,var_11.width,param1);
         }
      }
      
      public function set position(param1:Point) : void
      {
         this.setRectangle(param1.x,param1.y,var_11.width,var_11.height);
      }
      
      public function set rectangle(param1:Rectangle) : void
      {
         this.setRectangle(param1.x,param1.y,param1.width,param1.height);
      }
      
      public function set background(param1:Boolean) : void
      {
         var_473 = param1;
         var_240 = !!var_473 ? uint(var_240 | var_569) : uint(var_240 & 16777215);
         this.var_175 = this.var_175 || param1;
         _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
      }
      
      public function set color(param1:uint) : void
      {
         var_569 = param1 & 4278190080;
         var_240 = !!var_473 ? uint(param1) : uint(param1 & 16777215);
         _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
      }
      
      public function set alpha(param1:uint) : void
      {
         var_569 = param1 << 24;
         var_240 = !!var_473 ? uint(var_569 | var_240) : uint(16777215 & var_240);
         _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
      }
      
      public function set blend(param1:Number) : void
      {
         var_705 = param1 > 1 ? 1 : (param1 < 0 ? 0 : Number(param1));
         _context.invalidate(this,var_11,WindowRedrawFlag.const_1072);
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(param1 != var_294)
         {
            var_294 = param1;
            if(this.var_21)
            {
               this.var_21.visible = param1;
            }
            _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
         }
      }
      
      public function set type(param1:uint) : void
      {
         if(param1 != _type)
         {
            _type = param1;
            _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
         }
      }
      
      public function set caption(param1:String) : void
      {
         param1 = !!param1 ? param1 : "";
         if(param1 != caption)
         {
            var_20 = param1;
            _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
         }
      }
      
      public function set tags(param1:Array) : void
      {
         if(param1 != null)
         {
            var_875 = param1;
         }
      }
      
      public function set mouseThreshold(param1:uint) : void
      {
         var_472 = param1 > 255 ? 255 : uint(param1);
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      public function set procedure(param1:Function) : void
      {
         this.var_695 = param1;
      }
      
      public function set filters(param1:Array) : void
      {
         if(this.hasGraphicsContext())
         {
            this.getGraphicContext(true).filters = param1;
         }
      }
      
      public function set debug(param1:Boolean) : void
      {
         this._debug = param1;
      }
      
      public function set state(param1:uint) : void
      {
         if(param1 != _state)
         {
            _state = param1;
            _context.invalidate(this,var_11,WindowRedrawFlag.const_691);
         }
      }
      
      public function set style(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         var _loc4_:* = null;
         if(param1 != var_79)
         {
            var_79 = param1;
            _loc2_ = new Array();
            this.groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc2_);
            _loc3_ = uint(_loc2_.length);
            while(--_loc3_ > -1)
            {
               _loc4_ = _loc2_[_loc3_] as WindowController;
               if(_loc4_.tags.indexOf(const_1298) == -1)
               {
                  _loc4_.style = var_79;
               }
            }
            _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
         }
      }
      
      public function set clipping(param1:Boolean) : void
      {
         if(param1 != var_699)
         {
            var_699 = param1;
            _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
         }
      }
      
      public function get host() : IWindow
      {
         return this._parent == this.desktop ? {} : this._parent.host;
      }
      
      public function get desktop() : IDesktopWindow
      {
         return _context.getDesktopWindow();
      }
      
      public function set parent(param1:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == this)
         {
            throw new Error("Attempted to assign self as parent!");
         }
         if(param1 != null && param1.context != _context)
         {
            _context = WindowContext(param1.context);
            for each(_loc3_ in this._children)
            {
               _loc3_.parent = this;
            }
         }
         var _loc2_:IWindow = this._parent;
         if(this._parent != param1)
         {
            if(this._parent != null)
            {
               this._parent.removeChild(this);
            }
            this._parent = WindowController(param1);
            if(this._parent != null)
            {
               this.var_366 = this._parent.rectangle.clone();
               var_64.x = var_11.x;
               var_64.y = var_11.y;
               var_64.width = var_11.width;
               var_64.height = var_11.height;
               _loc4_ = WindowEvent.allocate(WindowEvent.const_618,this,this._parent);
               this.update(this,_loc4_);
            }
            else
            {
               this.var_366.x = 0;
               this.var_366.y = 0;
               this.var_366.width = 0;
               this.var_366.height = 0;
               _loc4_ = WindowEvent.allocate(WindowEvent.const_1620,this,_loc2_);
               this.update(this,_loc4_);
            }
            _loc4_.recycle();
         }
      }
      
      public function hasGraphicsContext() : Boolean
      {
         return this.var_21 != null || !testParamFlag(WindowParam.const_33);
      }
      
      public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !this.var_21)
         {
            this.var_21 = new GraphicContext("GC {" + _name + "}",GraphicContext.const_740,var_11);
            this.var_21.visible = var_294;
         }
         return this.var_21;
      }
      
      public function setupGraphicsContext() : IGraphicContext
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         this.var_21 = this.getGraphicContext(true);
         if(this._parent)
         {
            this._parent.setupGraphicsContext();
         }
         if(this._children.length > 0)
         {
            if(this.var_21.numChildContexts != this.numChildren)
            {
               _loc1_ = 0;
               for each(_loc2_ in this._children)
               {
                  this.var_21.addChildContextAt(_loc2_.getGraphicContext(true),_loc1_++);
               }
            }
         }
         this.var_1218 = true;
         return this.var_21;
      }
      
      public function releaseGraphicsContext() : void
      {
         this.var_1218 = false;
         if(!this.var_21)
         {
         }
      }
      
      public function clone() : IWindow
      {
         var _loc1_:Class = getDefinitionByName(getQualifiedClassName(this)) as Class;
         var _loc2_:WindowController = new _loc1_(_name,_type,var_79,var_19,_context,var_11,null,this.var_695,this.properties,var_875.concat(),_id) as WindowController;
         _loc2_.var_472 = var_472;
         _loc2_.var_175 = this.var_175;
         _loc2_._debug = this._debug;
         _loc2_.var_366 = this.var_366.clone();
         _loc2_.var_11 = var_11.clone();
         _loc2_.var_401 = var_401.clone();
         _loc2_.var_64 = var_64.clone();
         _loc2_.var_150 = !!var_150 ? var_150.clone() : null;
         _loc2_.var_149 = !!var_149 ? var_149.clone() : null;
         _loc2_.var_74 = !!var_74 ? var_74.clone(_loc2_) : null;
         _loc2_._context = _context;
         _loc2_.var_240 = var_240;
         _loc2_.var_569 = var_569;
         _loc2_.var_699 = var_699;
         _loc2_.var_294 = var_294;
         _loc2_.var_705 = var_705;
         _loc2_.var_19 = var_19;
         _loc2_._state = _state;
         _loc2_._name = _name;
         _loc2_._id = _id;
         _loc2_.caption = var_20;
         _loc2_.background = var_473;
         this.cloneChildWindows(_loc2_);
         return _loc2_;
      }
      
      protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.tags.indexOf(WindowController.TAG_EXCLUDE) == -1)
            {
               param1.addChild(_loc2_.clone());
            }
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!_disposed)
         {
            this.var_695 = null;
            if(true)
            {
               if(!this.isChildWindow())
               {
                  if(this.getStateFlag(WindowState.const_108))
                  {
                     this.deactivate();
                  }
               }
            }
            while(this._children.length > 0)
            {
               IDisposable(this._children.pop()).dispose();
            }
            this._children = null;
            if(this.parent)
            {
               this.parent = null;
            }
            _loc1_ = WindowDisposeEvent.allocate(this);
            this._events.dispatchEvent(_loc1_);
            _loc1_.recycle();
            if(this._events is IDisposable)
            {
               IDisposable(this._events).dispose();
               this._events = null;
            }
            if(this.var_21 != null)
            {
               this.var_21.dispose();
               this.var_21 = null;
            }
            super.dispose();
         }
      }
      
      public function toString() : String
      {
         return "[Window " + getQualifiedClassName(this) + " " + this.var_2541 + "]";
      }
      
      override public function invalidate(param1:Rectangle = null) : void
      {
         if(param1 == null)
         {
            param1 = var_11;
         }
         _context.invalidate(this,param1,WindowRedrawFlag.const_60);
      }
      
      public function resolve() : uint
      {
         return 0;
      }
      
      public function center() : void
      {
         if(this._parent != null)
         {
            this.x = this._parent.width / 2 - 0;
            this.y = this._parent.height / 2 - 0;
         }
      }
      
      public function setRectangle(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:* = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         param4 = Math.max(var_74.minHeight,param4);
         param4 = Math.min(var_74.maxHeight,param4);
         param3 = Math.max(var_74.minWidth,param3);
         param3 = Math.min(var_74.maxWidth,param3);
         var _loc5_:Boolean = param1 != var_11.x || param2 != var_11.y;
         var _loc6_:Boolean = param3 != var_11.width || param4 != var_11.height;
         if(_loc6_ && !_loc5_)
         {
            _loc7_ = uint(var_19 & 0);
            if(_loc7_ == WindowParam.const_552)
            {
               param1 -= (param3 - 0) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == WindowParam.const_455)
            {
               param1 -= param3 - 0;
               _loc5_ = true;
            }
            _loc7_ = uint(var_19 & 0);
            if(_loc7_ == WindowParam.const_477)
            {
               param2 -= (param4 - 0) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == WindowParam.const_594)
            {
               param2 -= param4 - 0;
               _loc5_ = true;
            }
         }
         if(testParamFlag(WindowParam.const_101))
         {
            if(this._parent != null)
            {
               _loc8_ = this._parent.rectangle;
               param1 = param1 < 0 ? 0 : int(param1);
               param2 = param2 < 0 ? 0 : int(param2);
               if(_loc5_)
               {
                  param1 -= param1 + param3 > _loc8_.width ? param1 + param3 - _loc8_.width : 0;
                  param2 -= param2 + param4 > _loc8_.height ? param2 + param4 - _loc8_.height : 0;
                  _loc5_ = param1 != var_11.x || param2 != var_11.y;
               }
               else
               {
                  param3 -= param1 + param3 > _loc8_.width ? param1 + param3 - _loc8_.width : 0;
                  param4 -= param2 + param4 > _loc8_.height ? param2 + param4 - _loc8_.height : 0;
                  _loc6_ = param3 != var_11.width || param4 != var_11.height;
               }
            }
         }
         if(_loc5_ || _loc6_)
         {
            if(_loc5_)
            {
               _loc9_ = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RELOCATE,this,null,true);
               this.update(this,_loc9_);
               if(_loc9_.isWindowOperationPrevented())
               {
                  _loc5_ = false;
               }
               _loc9_.recycle();
            }
            if(_loc6_)
            {
               _loc9_ = WindowEvent.allocate(WindowEvent.const_1195,this,null,true);
               this.update(this,_loc9_);
               if(_loc9_.isWindowOperationPrevented())
               {
                  _loc6_ = false;
               }
               _loc9_.recycle();
            }
            if(_loc5_)
            {
               var_64.x = var_11.x;
               var_64.y = var_11.y;
               var_64.width = var_11.width;
               var_64.height = var_11.height;
               var_11.x = param1;
               var_11.y = param2;
            }
            if(_loc6_)
            {
               var_64.width = var_11.width;
               var_64.height = var_11.height;
               var_11.width = param3;
               var_11.height = param4;
            }
            if(_loc5_)
            {
               _loc9_ = WindowEvent.allocate(WindowEvent.const_237,this,null);
               this.update(this,_loc9_);
               _loc9_.recycle();
            }
            if(_loc6_)
            {
               _loc9_ = WindowEvent.allocate(WindowEvent.const_41,this,null);
               this.update(this,_loc9_);
               _loc9_.recycle();
            }
         }
      }
      
      public function getRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null, param4:Rectangle = null) : void
      {
         if(param1 != null)
         {
            param1.x = var_11.x;
            param1.y = var_11.y;
            param1.width = var_11.width;
            param1.height = var_11.height;
         }
         if(param2 != null)
         {
            param2.x = var_64.x;
            param2.y = var_64.y;
            param2.width = var_64.width;
            param2.height = var_64.height;
         }
         if(param3 != null && var_150 != null)
         {
            param3.x = var_150.x;
            param3.y = var_150.y;
            param3.width = var_150.width;
            param3.height = var_150.height;
         }
         if(param4 != null && var_149 != null)
         {
            param4.x = var_149.x;
            param4.y = var_149.y;
            param4.width = var_149.width;
            param4.height = var_149.height;
         }
      }
      
      public function setRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null) : void
      {
         if(param3 != null)
         {
            if(param3.width < 0 || param3.height < 0)
            {
               throw new Error("Invalid rectangle; maximized size can\'t be less than zero!");
            }
            if(var_149 == null)
            {
               var_149 = new Rectangle();
            }
            var_149.x = param3.x;
            var_149.y = param3.y;
            var_149.width = param3.width;
            var_149.height = param3.height;
         }
         if(param2 != null)
         {
            if(param2.width < 0 || param2.height < 0)
            {
               throw new Error("Invalid rectangle; minimized size can\'t be less than zero!");
            }
            if(var_150 == null)
            {
               var_150 = new Rectangle();
            }
            var_150.x = param2.x;
            var_150.y = param2.y;
            var_150.width = param2.width;
            var_150.height = param2.height;
         }
         if(param3.width < param2.width || param3.height < param2.height)
         {
            param3.width = param2.width;
            param3.height = param2.height;
            throw new Error("Maximized rectangle can\'t be smaller than minimized rectangle!");
         }
         if(param1 != null)
         {
            this.setRectangle(param1.x,param1.y,param1.width,param1.height);
         }
      }
      
      public function buildFromXML(param1:XML, param2:Map = null) : Boolean
      {
         return _context.getWindowParser().parseAndConstruct(param1,this,param2) != null;
      }
      
      public function fetchDrawBuffer() : IBitmapDrawable
      {
         return !testParamFlag(WindowParam.const_33) ? this.getGraphicContext(true).fetchDrawBuffer() : (this._parent != null ? this._parent.fetchDrawBuffer() : null);
      }
      
      public function getDrawRegion(param1:Rectangle) : void
      {
         if(!testParamFlag(WindowParam.const_33))
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = var_11.width;
            param1.height = var_11.height;
         }
         else if(this._parent != null)
         {
            this._parent.getDrawRegion(param1);
            param1.x += var_11.x;
            param1.y += var_11.y;
            param1.width = var_11.width;
            param1.height = var_11.height;
         }
         else
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = 0;
            param1.height = 0;
         }
      }
      
      public function update(param1:WindowController, param2:WindowEvent) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         if(!testParamFlag(WindowParam.const_685))
         {
            this.procedure(param2,this);
            if(_disposed)
            {
               return true;
            }
            if(!param2.isWindowOperationPrevented())
            {
               if(this.hasEventListener(param2.type))
               {
                  this._events.dispatchEvent(param2);
                  if(_disposed)
                  {
                     return true;
                  }
               }
            }
            if(param2.cancelable)
            {
               if(param2.isWindowOperationPrevented())
               {
                  return true;
               }
            }
         }
         if(param2 is WindowMouseEvent)
         {
            switch(param2.type)
            {
               case WindowMouseEvent.const_42:
                  if(this.activate())
                  {
                     if(param2.cancelable)
                     {
                        param2.preventDefault();
                     }
                  }
                  this.setStateFlag(WindowState.const_93,true);
                  _loc4_ = _context.getWindowServices().getMouseListenerService();
                  _loc4_.begin(this);
                  _loc4_.eventTypes.push(WindowMouseEvent.const_52);
                  _loc4_.areaLimit = MouseListenerType.const_1222;
                  if(testParamFlag(WindowParam.const_432))
                  {
                     _loc3_ = {};
                     while(_loc3_ != null)
                     {
                        if(_loc3_.testParamFlag(WindowParam.const_273))
                        {
                           _context.getWindowServices().getMouseDraggingService().begin(_loc3_);
                           break;
                        }
                        _loc3_ = _loc3_.parent;
                     }
                  }
                  if((var_19 & 0) > 0)
                  {
                     _loc3_ = {};
                     while(_loc3_ != null)
                     {
                        if(_loc3_.testParamFlag(WindowParam.const_288))
                        {
                           _context.getWindowServices().getMouseScalingService().begin(_loc3_,var_19 & 0);
                           break;
                        }
                        _loc3_ = _loc3_.parent;
                     }
                  }
                  break;
               case WindowMouseEvent.const_52:
                  if(testStateFlag(WindowState.const_93))
                  {
                     this.setStateFlag(WindowState.const_93,false);
                  }
                  _context.getWindowServices().getMouseListenerService().end(this);
                  if(testParamFlag(WindowParam.const_273))
                  {
                     _context.getWindowServices().getMouseDraggingService().end(this);
                  }
                  if(testParamFlag(WindowParam.const_288))
                  {
                     _context.getWindowServices().getMouseScalingService().end(this);
                  }
                  break;
               case WindowMouseEvent.const_25:
                  if(testStateFlag(WindowState.const_90))
                  {
                     this.setStateFlag(WindowState.const_90,false);
                  }
                  if(testStateFlag(WindowState.const_93))
                  {
                     this.setStateFlag(WindowState.const_93,false);
                  }
                  break;
               case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
                  if(!testStateFlag(WindowState.const_90))
                  {
                     this.setStateFlag(WindowState.const_90,true);
                  }
                  break;
               case WindowMouseEvent.const_295:
                  return false;
            }
         }
         else if(param2 is WindowEvent)
         {
            switch(param2.type)
            {
               case WindowEvent.const_41:
                  _context.invalidate(this,var_11.union(var_64),WindowRedrawFlag.RESIZE);
                  if(param1 == this)
                  {
                     _loc5_ = WindowEvent.allocate(WindowEvent.const_929,this,null);
                     this.notifyChildren(_loc5_);
                     _loc5_.recycle();
                     if(testParamFlag(WindowParam.const_186,WindowParam.const_171))
                     {
                        this.updateScaleRelativeToParent();
                     }
                     else if(testParamFlag(WindowParam.const_209,WindowParam.const_183))
                     {
                        this.updateScaleRelativeToParent();
                     }
                     if(this._parent != null)
                     {
                        _loc6_ = uint(var_19);
                        var_19 &= ~(0 | 0);
                        if(testParamFlag(WindowParam.const_518))
                        {
                           this._parent.width += 0 - 0;
                        }
                        if(testParamFlag(WindowParam.const_540))
                        {
                           this._parent.height += 0 - 0;
                        }
                        var_19 = _loc6_;
                        _loc5_ = WindowEvent.allocate(WindowEvent.const_134,this._parent,this);
                        this._parent.update(this,_loc5_);
                        _loc5_.recycle();
                     }
                  }
                  break;
               case WindowEvent.const_237:
                  _context.invalidate(this,var_11.union(var_64),WindowRedrawFlag.const_1291);
                  if(param1 == this)
                  {
                     _loc5_ = WindowEvent.allocate(WindowEvent.const_1512,this,null);
                     this.notifyChildren(_loc5_);
                     _loc5_.recycle();
                     if(this._parent != null)
                     {
                        _loc5_ = WindowEvent.allocate(WindowEvent.const_187,this._parent,this);
                        this._parent.update(this,_loc5_);
                        _loc5_.recycle();
                     }
                  }
                  break;
               case WindowEvent.const_629:
                  if(param1 == this)
                  {
                     _loc5_ = WindowEvent.allocate(WindowEvent.const_1181,this,null);
                     this.notifyChildren(_loc5_);
                     _loc5_.recycle();
                     if(this._parent != null)
                     {
                        _loc5_ = WindowEvent.allocate(WindowEvent.const_292,this._parent,this);
                        this._parent.update(this,_loc5_);
                        _loc5_.recycle();
                     }
                  }
                  break;
               case WindowEvent.const_618:
                  if(testParamFlag(WindowParam.const_186,WindowParam.const_171))
                  {
                     this.updateScaleRelativeToParent();
                  }
                  else if(testParamFlag(WindowParam.const_209,WindowParam.const_183))
                  {
                     this.updateScaleRelativeToParent();
                  }
                  _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
                  break;
               case WindowEvent.const_929:
                  this._parent.getRegionProperties(null,this.var_366);
                  this.updateScaleRelativeToParent();
                  break;
               case WindowEvent.const_472:
                  if(testParamFlag(WindowParam.const_71))
                  {
                     expandToAccommodateChild(this,param2.related);
                  }
                  break;
               case WindowEvent.const_403:
                  break;
               case WindowEvent.const_292:
                  this.activate();
                  break;
               case WindowEvent.const_134:
                  if(testParamFlag(WindowParam.const_71))
                  {
                     expandToAccommodateChild(this,param2.related);
                  }
                  break;
               case WindowEvent.const_187:
                  if(testParamFlag(WindowParam.const_71))
                  {
                     expandToAccommodateChild(this,param2.related);
                  }
            }
         }
         return true;
      }
      
      protected function notifyEventListeners(param1:WindowEvent) : void
      {
         this.procedure(param1,this);
         if(!param1.isWindowOperationPrevented())
         {
            if(this.hasEventListener(param1.type))
            {
               this._events.dispatchEvent(param1);
            }
         }
      }
      
      private function nullEventProc(param1:WindowEvent, param2:IWindow) : void
      {
      }
      
      private function notifyChildren(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            _loc2_.update(this,param1);
         }
      }
      
      public function childRectToClippedDrawRegion(param1:Rectangle, param2:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc3_:Boolean = false;
         if(testParamFlag(WindowParam.const_33))
         {
            param1.offset(var_11.x,var_11.y);
            if(clipping)
            {
               _loc4_ = param1.intersection(var_11);
               if(param1.x < var_11.x)
               {
                  param2.x -= param1.x - 0;
                  param1.x = var_11.x;
                  _loc3_ = true;
               }
               if(param1.y < var_11.y)
               {
                  param2.y -= param1.y - 0;
                  param1.y = var_11.y;
                  _loc3_ = true;
               }
               if(param1.width != _loc4_.width)
               {
                  param1.width = _loc4_.width;
                  _loc3_ = true;
               }
               if(param1.height != _loc4_.height)
               {
                  param1.height = _loc4_.height;
                  _loc3_ = true;
               }
               param2.width = _loc4_.width;
               param2.height = _loc4_.height;
            }
            if(this._parent != null)
            {
               _loc3_ = WindowController(this._parent).childRectToClippedDrawRegion(param1,param2) || _loc3_;
            }
         }
         else if(clipping)
         {
            if(param1.x < 0)
            {
               param2.x -= param1.x;
               param1.x = 0;
               _loc3_ = true;
            }
            if(param1.y < 0)
            {
               param2.y -= param1.y;
               param1.y = 0;
               _loc3_ = true;
            }
            if(var_11.width < param1.right)
            {
               param2.right -= param1.right - 0;
               param1.right = param1.width;
               _loc3_ = true;
            }
            if(var_11.height < param1.bottom)
            {
               param2.bottom -= param1.bottom - 0;
               param1.bottom = var_11.height;
               _loc3_ = true;
            }
         }
         return !!_loc3_ ? param2.width > 0 && param2.height > 0 : true;
      }
      
      public function convertPointFromGlobalToLocalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(this._parent == null)
         {
            param1.x = var_11.x;
            param1.y = var_11.y;
         }
         else
         {
            this._parent.getGlobalPosition(param1);
            param1.x += var_11.x;
            param1.y += var_11.y;
         }
         param1.x = _loc2_ - param1.x;
         param1.y = _loc3_ - param1.y;
      }
      
      public function convertPointFromLocalToGlobalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(this._parent == null)
         {
            param1.x = var_11.x;
            param1.y = var_11.y;
         }
         else
         {
            this._parent.getGlobalPosition(param1);
            param1.x += var_11.x;
            param1.y += var_11.y;
         }
         param1.x += _loc2_;
         param1.y += _loc3_;
      }
      
      public function getRelativeMousePosition(param1:Point) : void
      {
         this.getGlobalPosition(param1);
         param1.x = _context.getDesktopWindow().mouseX - param1.x;
         param1.y = _context.getDesktopWindow().mouseY - param1.y;
      }
      
      public function getAbsoluteMousePosition(param1:Point) : void
      {
         param1.x = _context.getDesktopWindow().mouseX;
         param1.y = _context.getDesktopWindow().mouseY;
      }
      
      public function getLocalPosition(param1:Point) : void
      {
         param1.x = var_11.x;
         param1.y = var_11.y;
      }
      
      public function getLocalRectangle(param1:Rectangle) : void
      {
         param1.x = var_11.x;
         param1.y = var_11.y;
         param1.width = var_11.width;
         param1.height = var_11.height;
      }
      
      public function hitTestLocalPoint(param1:Point) : Boolean
      {
         return var_11.containsPoint(param1);
      }
      
      public function hitTestLocalRectangle(param1:Rectangle) : Boolean
      {
         return var_11.intersects(param1);
      }
      
      public function validateLocalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         return this.testLocalPointHitAgainstAlpha(param1,param2,var_472);
      }
      
      public function getGlobalPosition(param1:Point) : void
      {
         if(this._parent != null)
         {
            this._parent.getGlobalPosition(param1);
            param1.x += var_11.x;
            param1.y += var_11.y;
         }
         else
         {
            param1.x = var_11.x;
            param1.y = var_11.y;
         }
      }
      
      public function setGlobalPosition(param1:Point) : void
      {
         var _loc2_:Point = new Point();
         if(this._parent != null)
         {
            this._parent.getGlobalPosition(_loc2_);
            _loc2_.x += var_11.x;
            _loc2_.y += var_11.y;
         }
         else
         {
            _loc2_.x = var_11.x;
            _loc2_.y = var_11.y;
         }
         this.x = x + (param1.x - _loc2_.x);
         this.y = y + (param1.y - _loc2_.y);
      }
      
      public function getGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Rectangle = var_11;
         if(this._parent != null)
         {
            this._parent.getGlobalRectangle(param1);
            param1.x += _loc2_.x;
            param1.y += _loc2_.y;
         }
         else
         {
            param1.x = _loc2_.x;
            param1.y = _loc2_.y;
         }
         param1.width = _loc2_.width;
         param1.height = _loc2_.height;
      }
      
      public function setGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Point = new Point();
         if(this._parent != null)
         {
            this._parent.getGlobalPosition(_loc2_);
            _loc2_.x += var_11.x;
            _loc2_.y += var_11.y;
         }
         else
         {
            _loc2_.x = var_11.x;
            _loc2_.y = var_11.y;
         }
         this.setRectangle(x + (param1.x - _loc2_.x),y + (param1.y - _loc2_.y),param1.width,param1.height);
      }
      
      public function hitTestGlobalPoint(param1:Point) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         this.getGlobalRectangle(_loc2_);
         return _loc2_.containsPoint(param1);
      }
      
      public function hitTestGlobalRectangle(param1:Rectangle) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         this.getGlobalRectangle(_loc2_);
         return _loc2_.intersects(param1);
      }
      
      public function validateGlobalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         var _loc3_:Point = new Point();
         this.getGlobalPosition(_loc3_);
         _loc3_.x = param1.x - _loc3_.x;
         _loc3_.y = param1.y - _loc3_.y;
         return this.testLocalPointHitAgainstAlpha(_loc3_,param2,var_472);
      }
      
      public function getMouseRegion(param1:Rectangle) : void
      {
         var _loc2_:* = null;
         this.getGlobalRectangle(param1);
         if(param1.width < 0)
         {
            param1.width = 0;
         }
         if(param1.height < 0)
         {
            param1.height = 0;
         }
         if(testParamFlag(WindowParam.const_33))
         {
            _loc2_ = new Rectangle();
            IWindow(this._parent).getMouseRegion(_loc2_);
            if(param1.left < _loc2_.left)
            {
               param1.left = _loc2_.left;
            }
            if(param1.top < _loc2_.top)
            {
               param1.top = _loc2_.top;
            }
            if(param1.right > _loc2_.right)
            {
               param1.right = _loc2_.right;
            }
            if(param1.bottom > _loc2_.bottom)
            {
               param1.bottom = _loc2_.bottom;
            }
         }
      }
      
      protected function testLocalPointHitAgainstAlpha(param1:Point, param2:BitmapData, param3:uint) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:Boolean = false;
         if(true || true)
         {
            return false;
         }
         if(this.var_175 && var_472 > 0)
         {
            if(!testParamFlag(WindowParam.const_33))
            {
               if(param1.x <= var_11.width && param1.y <= var_11.height)
               {
                  _loc5_ = this.getGraphicContext(true).fetchDrawBuffer() as BitmapData;
                  if(_loc5_ != null)
                  {
                     _loc4_ = _loc5_.hitTest(const_1032,param3,param1);
                  }
               }
            }
            else
            {
               _loc4_ = param2 != null ? Boolean(param2.hitTest(const_1032,param3,param1)) : false;
            }
         }
         else if(param1.x >= 0 && param1.x < var_11.width)
         {
            if(param1.y >= 0 && param1.y < var_11.height)
            {
               _loc4_ = true;
            }
         }
         return _loc4_;
      }
      
      public function isCapableOfUsingSharedGraphicContext() : Boolean
      {
         return true;
      }
      
      public function resolveVerticalScale() : Number
      {
         return 0 / 0;
      }
      
      public function resolveHorizontalScale() : Number
      {
         return 0 / 0;
      }
      
      public function offset(param1:Number, param2:Number) : void
      {
         this.setRectangle(var_11.x + param1,var_11.y + param2,var_11.width,var_11.height);
      }
      
      public function scale(param1:Number, param2:Number) : void
      {
         this.setRectangle(var_11.x,var_11.y,var_11.width + param1,var_11.height + param2);
      }
      
      public function expandToAccommodateChildren() : void
      {
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = this.getParamFlag(WindowParam.const_71);
         for each(_loc1_ in this._children)
         {
            _loc6_ = _loc1_.rectangle;
            if(_loc6_.x < _loc2_)
            {
               _loc4_ -= _loc6_.x - _loc2_;
               _loc2_ = _loc6_.x;
               _loc7_ = true;
            }
            if(_loc6_.right > _loc4_)
            {
               _loc4_ = _loc6_.x + _loc6_.width;
               _loc7_ = true;
            }
            if(_loc6_.y < _loc3_)
            {
               _loc5_ -= _loc6_.y - _loc3_;
               _loc3_ = _loc6_.y;
               _loc7_ = true;
            }
            if(_loc6_.bottom > _loc5_)
            {
               _loc5_ = _loc6_.y + _loc6_.height;
               _loc7_ = true;
            }
         }
         if(_loc7_)
         {
            if(_loc8_)
            {
               this.setParamFlag(WindowParam.const_71,false);
            }
            this.setRectangle(var_11.x + _loc2_,var_11.y + _loc3_,_loc4_,_loc5_);
            for each(_loc1_ in this._children)
            {
               _loc1_.offset(-_loc2_,-_loc3_);
            }
            if(_loc8_)
            {
               this.setParamFlag(WindowParam.const_71,true);
            }
         }
      }
      
      public function getStateFlag(param1:uint) : Boolean
      {
         return (_state & param1) != 0;
      }
      
      public function setStateFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = _state;
         var _loc4_:*;
         _state = !!param2 ? (_loc4_ = _state | param1, _state |= param1, uint(_loc4_)) : (_loc4_ = _state & ~param1, _state &= ~param1, uint(_loc4_));
         if(_state != _loc3_)
         {
            _context.invalidate(this,var_11,WindowRedrawFlag.const_691);
         }
      }
      
      public function getStyleFlag(param1:uint) : Boolean
      {
         return (var_79 & param1) != 0;
      }
      
      public function setStyleFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc3_:uint = var_79;
         var _loc7_:*;
         var_79 = !!param2 ? (_loc7_ = var_79 | param1, var_79 |= param1, uint(_loc7_)) : (_loc7_ = var_79 & ~param1, var_79 &= ~param1, uint(_loc7_));
         if(var_79 != _loc3_)
         {
            _loc4_ = new Array();
            this.groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc4_);
            _loc5_ = uint(_loc4_.length);
            while(--_loc5_ > -1)
            {
               _loc6_ = _loc4_[_loc5_] as WindowController;
               if(_loc6_.tags.indexOf(const_1298) == -1)
               {
                  _loc6_.style = var_79;
               }
            }
            _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
         }
      }
      
      public function getParamFlag(param1:uint) : Boolean
      {
         return (var_19 & param1) != 0;
      }
      
      public function setParamFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_19;
         var _loc4_:*;
         var_19 = !!param2 ? (_loc4_ = var_19 | param1, var_19 |= param1, uint(_loc4_)) : (_loc4_ = var_19 & ~param1, var_19 &= ~param1, uint(_loc4_));
         if(var_19 != _loc3_)
         {
            if(!(var_19 & 0))
            {
               if(!this.var_21)
               {
                  this.setupGraphicsContext();
                  _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
               }
            }
            else if(var_19 & 0)
            {
               if(this.var_21)
               {
                  _context.invalidate(this,var_11,WindowRedrawFlag.const_60);
               }
            }
         }
      }
      
      protected function updateScaleRelativeToParent() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         if(this._parent == null)
         {
            return;
         }
         var _loc1_:* = !testParamFlag(WindowParam.const_153,WindowParam.const_171);
         var _loc2_:* = !testParamFlag(WindowParam.const_133,WindowParam.const_183);
         if(_loc1_ || _loc2_)
         {
            _loc3_ = var_11.clone();
            if(_loc1_)
            {
               _loc4_ = this._parent.width - this.var_366.width;
               _loc5_ = uint(var_19 & 0);
               if(_loc5_ == WindowParam.const_384)
               {
                  _loc3_.width += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_370)
               {
                  _loc3_.x += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_186)
               {
                  if(this._parent.width < _loc3_.width && this.getParamFlag(WindowParam.const_33))
                  {
                     _loc3_.x = 0;
                  }
                  else
                  {
                     _loc3_.x = this._parent.width / 2 - _loc3_.width / 2;
                  }
               }
            }
            if(_loc2_)
            {
               _loc4_ = this._parent.height - this.var_366.height;
               _loc5_ = uint(var_19 & 0);
               if(_loc5_ == WindowParam.const_308)
               {
                  _loc3_.height += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_251)
               {
                  _loc3_.y += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_209)
               {
                  if(this._parent.height < _loc3_.height && this.getParamFlag(WindowParam.const_33))
                  {
                     _loc3_.y = 0;
                  }
                  else
                  {
                     _loc3_.y = this._parent.height / 2 - _loc3_.height / 2;
                  }
               }
            }
            _loc6_ = uint(var_19);
            var_19 &= -1;
            this.setRectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
            var_19 = _loc6_;
         }
         else if(testParamFlag(WindowParam.const_101))
         {
            _loc3_ = var_11.clone();
            if(this._parent != null)
            {
               _loc7_ = this._parent.rectangle;
               _loc3_.x = _loc3_.x < 0 ? 0 : Number(_loc3_.x);
               _loc3_.y = _loc3_.y < 0 ? 0 : Number(_loc3_.y);
               _loc3_.x -= _loc3_.x + _loc3_.width > _loc7_.width ? _loc3_.x + _loc3_.width - _loc7_.width : 0;
               _loc3_.y -= _loc3_.y + _loc3_.height > _loc7_.height ? _loc3_.y + _loc3_.height - _loc7_.height : 0;
               _loc3_.width -= _loc3_.x + _loc3_.width > _loc7_.width ? _loc3_.x + _loc3_.width - _loc7_.width : 0;
               _loc3_.height -= _loc3_.y + _loc3_.height > _loc7_.height ? _loc3_.y + _loc3_.height - _loc7_.height : 0;
               if(_loc3_.x != var_11.x || _loc3_.y != var_11.y || _loc3_.width != var_11.width || _loc3_.height != var_11.height)
               {
                  _loc6_ = uint(var_19);
                  var_19 &= -1;
                  this.setRectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
                  var_19 = _loc6_;
               }
            }
         }
      }
      
      protected function isChildWindow() : Boolean
      {
         return this._parent != context.getDesktopWindow();
      }
      
      public function destroy() : Boolean
      {
         if(_state == WindowState.const_573)
         {
            return true;
         }
         _state = WindowState.const_573;
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1668,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         _loc1_ = WindowEvent.allocate(WindowEvent.const_323,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         this.dispose();
         return true;
      }
      
      public function minimize() : Boolean
      {
         if(_state & 0)
         {
            return false;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1625,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_73,true);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_1701,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function maximize() : Boolean
      {
         if(_state & 0)
         {
            return false;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1745,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_73,true);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_1730,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function restore() : Boolean
      {
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1583,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_73,false);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_1637,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function activate() : Boolean
      {
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1754,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_108,true);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_629,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function deactivate() : Boolean
      {
         if(!this.getStateFlag(WindowState.const_108))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1640,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_108,false);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_510,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function lock() : Boolean
      {
         if(this.getStateFlag(WindowState.const_73))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1780,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_73,true);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_1521,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function unlock() : Boolean
      {
         if(!this.getStateFlag(WindowState.const_73))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1628,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_73,false);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_1539,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function enable() : Boolean
      {
         if(!this.getStateFlag(WindowState.const_84))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_764,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_84,false);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_271,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function disable() : Boolean
      {
         if(this.getStateFlag(WindowState.const_84))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_820,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_84,true);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_185,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function focus() : Boolean
      {
         if(this.getStateFlag(WindowState.const_85))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1697,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_85,true);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_306,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function unfocus() : Boolean
      {
         if(!this.getStateFlag(WindowState.const_85))
         {
            return true;
         }
         var _loc1_:WindowEvent = WindowEvent.allocate(WindowEvent.const_1633,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            _loc1_.recycle();
            return false;
         }
         _loc1_.recycle();
         this.setStateFlag(WindowState.const_85,false);
         _loc1_ = WindowEvent.allocate(WindowEvent.const_1656,this,null);
         this.update(this,_loc1_);
         _loc1_.recycle();
         return true;
      }
      
      public function getChildUnderPoint(param1:Point) : IWindow
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         if(var_294)
         {
            _loc2_ = new Rectangle();
            this.getMouseRegion(_loc2_);
            _loc3_ = _loc2_.containsPoint(param1);
            _loc5_ = uint(this.numChildren);
            if(_loc3_)
            {
               while(_loc5_ > 0)
               {
                  _loc4_ = WindowController(this._children[_loc5_ - 1]).getChildUnderPoint(param1);
                  if(_loc4_ != null)
                  {
                     return _loc4_;
                  }
                  _loc5_--;
               }
            }
            if(this.validateGlobalPointIntersection(param1,null))
            {
               return this;
            }
         }
         return null;
      }
      
      public function groupChildrenUnderPoint(param1:Point, param2:Array) : void
      {
         var _loc3_:* = null;
         if(var_294)
         {
            if(var_11.containsPoint(param1))
            {
               param2.push(this);
               param1.offset(0,0);
               for each(_loc3_ in this._children)
               {
                  _loc3_.groupChildrenUnderPoint(param1,param2);
               }
               param1.offset(var_11.x,var_11.y);
            }
            else if(!var_699)
            {
               param1.offset(0,0);
               for each(_loc3_ in this._children)
               {
                  _loc3_.groupChildrenUnderPoint(param1,param2);
               }
               param1.offset(var_11.x,var_11.y);
            }
         }
      }
      
      public function groupParameterFilteredChildrenUnderPoint(param1:Point, param2:Array, param3:uint = 0) : void
      {
         var _loc4_:* = null;
         if(var_294)
         {
            if(var_11.containsPoint(param1))
            {
               if((var_19 & param3) == param3)
               {
                  param2.push(this);
               }
               param1.offset(0,0);
               for each(_loc4_ in this._children)
               {
                  _loc4_.groupParameterFilteredChildrenUnderPoint(param1,param2,param3);
               }
               param1.offset(var_11.x,var_11.y);
            }
            else if(!var_699)
            {
               param1.offset(0,0);
               for each(_loc4_ in this._children)
               {
                  _loc4_.groupParameterFilteredChildrenUnderPoint(param1,param2,param3);
               }
               param1.offset(var_11.x,var_11.y);
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(!_disposed)
         {
            this._events.addEventListener(param1,param2,param3);
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!_disposed)
         {
            _loc2_ = this._events.dispatchEvent(WindowEvent(param1));
         }
         return _loc2_;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return !!_disposed ? false : Boolean(this._events.hasEventListener(param1));
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(!_disposed)
         {
            this._events.removeEventListener(param1,param2,param3);
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return !!_disposed ? false : Boolean(this._events.hasEventListener(param1));
      }
      
      public function get numChildren() : int
      {
         return this._children.length;
      }
      
      public function populate(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:Boolean = false;
         for each(_loc3_ in param1)
         {
            if(_loc3_ && _loc3_.parent != this)
            {
               this._children.push(_loc3_);
               _loc3_.parent = this;
               _loc2_ = _loc2_ || _loc3_.hasGraphicsContext();
            }
         }
         if(this.var_1218 || _loc2_)
         {
            this.setupGraphicsContext();
         }
      }
      
      public function addChild(param1:IWindow) : IWindow
      {
         var _loc2_:WindowController = WindowController(param1);
         if(_loc2_.parent != null)
         {
            WindowController(_loc2_.parent).removeChild(_loc2_);
         }
         this._children.push(_loc2_);
         _loc2_.parent = this;
         if(this.var_1218 || _loc2_.hasGraphicsContext())
         {
            this.setupGraphicsContext();
            if(_loc2_.getGraphicContext(true).parent != this.var_21)
            {
               this.var_21.addChildContext(_loc2_.getGraphicContext(true));
            }
         }
         var _loc3_:WindowEvent = WindowEvent.allocate(WindowEvent.const_472,this,param1);
         this.update(this,_loc3_);
         _loc3_.recycle();
         return param1;
      }
      
      public function addChildAt(param1:IWindow, param2:int) : IWindow
      {
         var _loc3_:WindowController = WindowController(param1);
         if(_loc3_.parent != null)
         {
            WindowController(_loc3_.parent).removeChild(_loc3_);
         }
         this._children.splice(param2,0,_loc3_);
         _loc3_.parent = this;
         if(this.var_1218 || _loc3_.hasGraphicsContext())
         {
            this.setupGraphicsContext();
            if(_loc3_.getGraphicContext(true).parent != this.var_21)
            {
               this.var_21.addChildContextAt(_loc3_.getGraphicContext(true),param2);
            }
         }
         var _loc4_:WindowEvent = WindowEvent.allocate(WindowEvent.const_472,this,param1);
         this.update(this,_loc4_);
         _loc4_.recycle();
         return param1;
      }
      
      public function getChildAt(param1:int) : IWindow
      {
         return this._children[param1] as IWindow;
      }
      
      public function getChildByID(param1:uint) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getChildByName(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findChildByName(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc2_ in this._children)
         {
            _loc2_ = _loc2_.findChildByName(param1) as WindowController;
            if(_loc2_)
            {
               return _loc2_ as IWindow;
            }
         }
         return null;
      }
      
      public function getChildByTag(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.tags.indexOf(param1) > -1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findChildByTag(param1:String) : IWindow
      {
         if(var_875.indexOf(param1) > -1)
         {
            return this;
         }
         var _loc2_:WindowController = WindowController(this.getChildByTag(param1));
         if(_loc2_ == null)
         {
            for each(_loc2_ in this._children)
            {
               _loc2_ = _loc2_.findChildByTag(param1) as WindowController;
               if(_loc2_ != null)
               {
                  break;
               }
            }
         }
         return _loc2_ as IWindow;
      }
      
      public function getChildIndex(param1:IWindow) : int
      {
         return this._children.indexOf(param1);
      }
      
      public function removeChild(param1:IWindow) : IWindow
      {
         var _loc2_:int = this._children.indexOf(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         this._children.splice(_loc2_,1);
         var _loc3_:WindowController = WindowController(param1);
         _loc3_.parent = null;
         if(_loc3_.hasGraphicsContext())
         {
            this.var_21.removeChildContext(_loc3_.getGraphicContext(true));
         }
         var _loc4_:WindowEvent = WindowEvent.allocate(WindowEvent.const_403,this,param1);
         this.update(this,_loc4_);
         _loc4_.recycle();
         return param1;
      }
      
      public function removeChildAt(param1:int) : IWindow
      {
         return this.removeChild(this.getChildAt(param1));
      }
      
      public function setChildIndex(param1:IWindow, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = this._children.indexOf(param1);
         if(_loc3_ > -1 && param2 != _loc3_)
         {
            this._children.splice(_loc3_,1);
            this._children.splice(param2,0,param1);
            _loc4_ = WindowController(param1);
            if(_loc4_.hasGraphicsContext())
            {
               this.var_21.setChildContextIndex(_loc4_.getGraphicContext(true),this.getChildIndex(_loc4_));
            }
         }
      }
      
      public function swapChildren(param1:IWindow, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 != null && param2 != null && param1 != param2)
         {
            _loc3_ = this._children.indexOf(param1);
            if(_loc3_ < 0)
            {
               return;
            }
            _loc4_ = this._children.indexOf(param2);
            if(_loc4_ < 0)
            {
               return;
            }
            if(_loc4_ < _loc3_)
            {
               _loc5_ = param1;
               param1 = param2;
               param2 = _loc5_;
               _loc6_ = _loc3_;
               _loc3_ = _loc4_;
               _loc4_ = _loc6_;
            }
            this._children.splice(_loc4_,1);
            this._children.splice(_loc3_,1);
            this._children.splice(_loc3_,0,param2);
            this._children.splice(_loc4_,0,param1);
            if(WindowController(param1).hasGraphicsContext() || WindowController(param2).hasGraphicsContext())
            {
               this.var_21.swapChildContexts(WindowController(param1).getGraphicContext(true),WindowController(param2).getGraphicContext(true));
            }
         }
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         this.swapChildren(this._children[param1],this._children[param2]);
         this.var_21.swapChildContextsAt(param1,param2);
      }
      
      public function groupChildrenWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         for each(_loc4_ in this._children)
         {
            if(_loc4_.id == param1)
            {
               param2.push(_loc4_);
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ += _loc4_.groupChildrenWithID(param1,param2,param3);
            }
         }
         return _loc5_;
      }
      
      public function groupChildrenWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         for each(_loc4_ in this._children)
         {
            if(_loc4_.tags.indexOf(param1) > -1)
            {
               param2.push(_loc4_);
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ += _loc4_.groupChildrenWithTag(param1,param2,param3);
            }
         }
         return _loc5_;
      }
      
      public function findParentByName(param1:String) : IWindow
      {
         if(_name == param1)
         {
            return this;
         }
         if(this._parent != null)
         {
            if(this._parent.name == param1)
            {
               return this._parent;
            }
            return this._parent.findParentByName(param1);
         }
         return null;
      }
      
      protected function requiresOwnGraphicContext() : Boolean
      {
         var _loc1_:* = null;
         if(testParamFlag(WindowParam.const_33))
         {
            for each(_loc1_ in this._children)
            {
               if(_loc1_.requiresOwnGraphicContext())
               {
                  return true;
               }
            }
            return false;
         }
         return true;
      }
   }
}
