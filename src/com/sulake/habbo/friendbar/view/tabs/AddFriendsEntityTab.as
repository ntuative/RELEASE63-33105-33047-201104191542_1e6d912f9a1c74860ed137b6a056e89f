package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import flash.display.BitmapData;
   
   public class AddFriendsEntityTab extends Tab
   {
      
      private static const const_998:String = "icon";
      
      private static const TEXT:String = "text";
      
      private static const const_687:String = "header";
      
      private static const const_1811:String = "title";
      
      private static const BUTTON:String = "button";
      
      private static const const_1322:String = "addFriendsEntityTabXML";
      
      private static const const_1323:String = "friends_icon_png";
       
      
      private var var_1661:int;
      
      public function AddFriendsEntityTab()
      {
         this.var_1661 = name_1;
         super();
         _window = var_1320.buildFromXML(var_863.getAssetByName(const_1322).content as XML) as IWindowContainer;
         _window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
         _window.findChildByName(const_687).addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseClick);
         this.var_1661 = _window.height;
         _window.height = name_1;
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName(const_998) as IBitmapWrapperWindow;
         _loc1_.disposesBitmap = false;
         _loc1_.bitmap = var_863.getAssetByName(const_1323).content as BitmapData;
         var _loc2_:IWindow = _window.findChildByName(BUTTON);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
         var _loc3_:IWindow = _window.findChildByName(TEXT);
         _loc3_.visible = false;
      }
      
      override public function select() : void
      {
         if(!selected)
         {
            _window.height = this.var_1661;
            _window.y = 0 - (0 - name_1);
            _window.findChildByName(TEXT).visible = true;
            super.select();
         }
      }
      
      override public function deselect() : void
      {
         if(selected)
         {
            _window.y = 0;
            _window.height = name_1;
            _window.findChildByName(TEXT).visible = false;
            super.deselect();
         }
      }
      
      override public function recycle() : void
      {
         dispose();
      }
      
      private function onMouseClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            if(selected)
            {
               var_1064.deSelect();
            }
            else
            {
               var_1064.selectTab(this);
            }
         }
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            var_1065.findNewFriends();
            this.deselect();
         }
      }
   }
}
