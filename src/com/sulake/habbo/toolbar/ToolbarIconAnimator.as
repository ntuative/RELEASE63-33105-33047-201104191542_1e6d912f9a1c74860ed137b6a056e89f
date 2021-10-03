package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ToolbarIconAnimator
   {
       
      
      private var _frame:int;
      
      private var var_966:int;
      
      private var var_965:Array;
      
      private var var_967:Array;
      
      private var var_2940:Number;
      
      private var var_2939:Number;
      
      private var _state:String;
      
      private var var_1772:String;
      
      private var var_789:BitmapData;
      
      private var var_1484:Boolean;
      
      public function ToolbarIconAnimator(param1:StateItem, param2:IAssetLibrary, param3:IBitmapWrapperWindow, param4:Number, param5:Number, param6:BitmapData = null)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         super();
         if(param1 == null || param2 == null || param3 == null)
         {
            return;
         }
         this.var_2940 = param4;
         this.var_2939 = param5;
         this._frame = 0;
         this.var_966 = 0;
         this.var_965 = new Array();
         this.var_967 = new Array();
         this._state = param1.id;
         this.var_1772 = param1.nextState;
         this.var_1484 = param1.loop;
         if(param1.background != null)
         {
            this.var_789 = this.getBitmapDataFromAsset(param1.background,param2);
         }
         var _loc9_:XMLList = param1.frames;
         if(_loc9_.length() > 0)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc9_.length())
            {
               _loc11_ = _loc9_[_loc10_];
               _loc7_ = "icon_" + param1.nameBase + "_" + _loc11_.@id;
               _loc11_.@assetName = _loc7_;
               _loc8_ = this.getBitmapDataFromAsset(_loc7_,param2);
               if(_loc8_ != null)
               {
                  this.var_965.push(_loc11_);
                  this.var_967.push(_loc8_);
               }
               _loc10_++;
            }
         }
         else
         {
            _loc7_ = "icon_" + param1.nameBase + "_0";
            _loc8_ = this.getBitmapDataFromAsset(_loc7_,param2);
            if(_loc8_ != null)
            {
               this.var_965.push(new XML());
               this.var_967.push(_loc8_);
            }
         }
         if(param6 != null)
         {
            this.var_967[this._frame] = param6.clone();
         }
         this.updateAssetInWindow(param3);
      }
      
      public function update(param1:IBitmapWrapperWindow) : void
      {
         if(this.var_1484 == true || this.var_966 == 0)
         {
            if(this.var_965.length > 0)
            {
               ++this._frame;
               if(this._frame >= this.var_965.length)
               {
                  this._frame = 0;
                  ++this.var_966;
               }
            }
            if(this.var_1484 == true || this.var_966 == 0)
            {
               this.updateAssetInWindow(param1);
            }
         }
      }
      
      public function get frameCount() : int
      {
         return this.var_965.length;
      }
      
      public function hasNextState() : Boolean
      {
         return this.var_1484 == false && this.var_966 == 1 && this.var_1772 != this._state;
      }
      
      public function get nextState() : String
      {
         return this.var_1772;
      }
      
      private function getBitmapDataFromAsset(param1:String, param2:IAssetLibrary) : BitmapData
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2.hasAsset(param1))
         {
            _loc3_ = param2.getAssetByName(param1) as BitmapDataAsset;
            if(_loc3_ != null)
            {
               return (_loc3_.content as BitmapData).clone();
            }
         }
         return null;
      }
      
      private function updateAssetInWindow(param1:IBitmapWrapperWindow) : void
      {
         var _loc2_:* = null;
         if(this._frame <= this.var_967.length)
         {
            _loc2_ = this.var_967[this._frame];
            if(_loc2_ != null && param1 != null && _loc2_ is BitmapData)
            {
               this.setAsset(param1,_loc2_);
            }
         }
      }
      
      private function setAsset(param1:IBitmapWrapperWindow, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_789 != null)
         {
            _loc3_ = new BitmapData(Math.max(param2.width,this.var_789.width),Math.max(param2.height,this.var_789.height),true,0);
            _loc4_ = _loc3_.height - this.var_789.rect.height;
            _loc3_.copyPixels(this.var_789,this.var_789.rect,new Point(0,_loc4_),null,null,true);
            _loc3_.copyPixels(param2,param2.rect,new Point((_loc3_.width - param2.width) / 2,(_loc3_.height - param2.height) / 2),null,null,true);
         }
         else
         {
            _loc3_ = param2.clone();
         }
         param1.width = _loc3_.width;
         param1.height = _loc3_.height;
         param1.bitmap = _loc3_;
      }
   }
}
