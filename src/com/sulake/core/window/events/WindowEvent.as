package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1668:String = "WE_DESTROY";
      
      public static const const_323:String = "WE_DESTROYED";
      
      public static const const_1577:String = "WE_OPEN";
      
      public static const const_1735:String = "WE_OPENED";
      
      public static const const_1775:String = "WE_CLOSE";
      
      public static const const_1570:String = "WE_CLOSED";
      
      public static const const_1697:String = "WE_FOCUS";
      
      public static const const_306:String = "WE_FOCUSED";
      
      public static const const_1633:String = "WE_UNFOCUS";
      
      public static const const_1656:String = "WE_UNFOCUSED";
      
      public static const const_1754:String = "WE_ACTIVATE";
      
      public static const const_629:String = "WE_ACTIVATED";
      
      public static const const_1640:String = "WE_DEACTIVATE";
      
      public static const const_510:String = "WE_DEACTIVATED";
      
      public static const const_341:String = "WE_SELECT";
      
      public static const const_57:String = "WE_SELECTED";
      
      public static const const_592:String = "WE_UNSELECT";
      
      public static const const_479:String = "WE_UNSELECTED";
      
      public static const const_1780:String = "WE_LOCK";
      
      public static const const_1521:String = "WE_LOCKED";
      
      public static const const_1628:String = "WE_UNLOCK";
      
      public static const const_1539:String = "WE_UNLOCKED";
      
      public static const const_764:String = "WE_ENABLE";
      
      public static const const_271:String = "WE_ENABLED";
      
      public static const const_820:String = "WE_DISABLE";
      
      public static const const_185:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_237:String = "WE_RELOCATED";
      
      public static const const_1195:String = "WE_RESIZE";
      
      public static const const_41:String = "WE_RESIZED";
      
      public static const const_1625:String = "WE_MINIMIZE";
      
      public static const const_1701:String = "WE_MINIMIZED";
      
      public static const const_1745:String = "WE_MAXIMIZE";
      
      public static const const_1730:String = "WE_MAXIMIZED";
      
      public static const const_1583:String = "WE_RESTORE";
      
      public static const const_1637:String = "WE_RESTORED";
      
      public static const const_472:String = "WE_CHILD_ADDED";
      
      public static const const_403:String = "WE_CHILD_REMOVED";
      
      public static const const_187:String = "WE_CHILD_RELOCATED";
      
      public static const const_134:String = "WE_CHILD_RESIZED";
      
      public static const const_292:String = "WE_CHILD_ACTIVATED";
      
      public static const const_618:String = "WE_PARENT_ADDED";
      
      public static const const_1620:String = "WE_PARENT_REMOVED";
      
      public static const const_1512:String = "WE_PARENT_RELOCATED";
      
      public static const const_929:String = "WE_PARENT_RESIZED";
      
      public static const const_1181:String = "WE_PARENT_ACTIVATED";
      
      public static const const_179:String = "WE_OK";
      
      public static const const_459:String = "WE_CANCEL";
      
      public static const const_104:String = "WE_CHANGE";
      
      public static const const_542:String = "WE_SCROLL";
      
      public static const const_178:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_697:IWindow;
      
      protected var var_1074:Boolean;
      
      protected var var_469:Boolean;
      
      protected var var_564:Boolean;
      
      protected var var_696:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_697 = param3;
         _loc5_.var_469 = param4;
         _loc5_.var_564 = false;
         _loc5_.var_696 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_697;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_469;
      }
      
      public function recycle() : void
      {
         if(this.var_564)
         {
            throw new Error("Event already recycled!");
         }
         this.var_697 = null;
         this._window = null;
         this.var_564 = true;
         this.var_1074 = false;
         this.var_696.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1074;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1074 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1074;
      }
      
      public function stopPropagation() : void
      {
         this.var_1074 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1074 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_469 + " window: " + this._window + " }";
      }
   }
}
