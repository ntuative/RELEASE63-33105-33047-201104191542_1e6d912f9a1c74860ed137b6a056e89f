package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.IHabboFriendBarView;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class Tab implements ITab
   {
      
      public static var name_5:int = 127;
      
      public static var name_1:int = 36;
      
      public static var var_1065:IHabboFriendBarData;
      
      public static var var_1064:IHabboFriendBarView;
      
      public static var var_863:IAssetLibrary;
      
      public static var var_1320:IHabboWindowManager;
      
      public static var var_2114:TextCropper;
       
      
      protected var _window:IWindowContainer;
      
      protected var var_564:Boolean;
      
      private var _selected:Boolean;
      
      private var _disposed:Boolean;
      
      public function Tab()
      {
         super();
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function get recycled() : Boolean
      {
         return this.var_564;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function select() : void
      {
         this._selected = true;
      }
      
      public function deselect() : void
      {
         this._selected = false;
      }
      
      public function recycle() : void
      {
         this.var_564 = true;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this._window)
            {
               this._window.dispose();
               this._window = null;
            }
            this._disposed = true;
         }
      }
   }
}
