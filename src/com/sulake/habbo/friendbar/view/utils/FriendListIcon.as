package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.events.TimerEvent;
   
   public class FriendListIcon extends Icon
   {
      
      private static const const_1049:int = 200;
      
      private static const const_1048:int = 500;
       
      
      private var _assets:IAssetLibrary;
      
      public function FriendListIcon(param1:IAssetLibrary, param2:IBitmapWrapperWindow)
      {
         super();
         this._assets = param1;
         alignment = const_634 | const_633;
         image = param1.getAssetByName("icon_friendlist_png") as BitmapDataAsset;
         canvas = param2;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._assets = null;
            super.dispose();
         }
      }
      
      override public function notify(param1:Boolean) : void
      {
         super.notify(param1);
         this.enable(param1);
         toggleTimer(param1 || var_870,!!var_870 ? int(const_1049) : int(const_1048));
         if(!var_871 && !var_870)
         {
            image = this._assets.getAssetByName("icon_friendlist_png") as BitmapDataAsset;
         }
      }
      
      override public function hover(param1:Boolean) : void
      {
         super.hover(param1);
         toggleTimer(param1 || var_871,!!var_870 ? int(const_1049) : int(const_1048));
         if(!var_871 && !var_870)
         {
            image = this._assets.getAssetByName("icon_friendlist_png") as BitmapDataAsset;
         }
      }
      
      override public function enable(param1:Boolean) : void
      {
         canvas.blend = !!disabled ? 0.5 : Number(1);
      }
      
      override protected function method_3(param1:TimerEvent) : void
      {
         if(var_870)
         {
            _frame = ++_frame % 4;
            image = this._assets.getAssetByName("icon_friendlist_hover_" + _frame + "_png") as BitmapDataAsset;
         }
         else if(var_871)
         {
            _frame = ++_frame % 2;
            image = this._assets.getAssetByName("icon_friendlist_notify_" + _frame + "_png") as BitmapDataAsset;
         }
      }
   }
}
