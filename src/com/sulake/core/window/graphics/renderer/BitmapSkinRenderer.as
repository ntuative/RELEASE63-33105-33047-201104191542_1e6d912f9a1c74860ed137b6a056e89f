package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.BitmapSkinParser;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.IBitmapDrawable;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class BitmapSkinRenderer extends SkinRenderer implements ISkinRenderer
   {
      
      private static var ALPHA:ColorTransform = new ColorTransform(1,1,1,1);
      
      private static var var_29:Rectangle = new Rectangle();
      
      private static const TOP_LEFT:Point = new Point();
       
      
      protected var var_877:Dictionary;
      
      protected var var_876:Dictionary;
      
      private var var_277:Matrix;
      
      private var var_849:ColorTransform;
      
      public function BitmapSkinRenderer(param1:String)
      {
         super(param1);
         this.var_877 = new Dictionary(false);
         this.var_876 = new Dictionary(false);
         this.var_277 = new Matrix();
         this.var_849 = new ColorTransform();
      }
      
      override public function parse(param1:IAsset, param2:XMLList, param3:IAssetLibrary) : void
      {
         BitmapSkinParser.parseSkinDescription(param1.content as XML,param2,this,name,param3);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!disposed)
         {
            super.dispose();
            this.var_277 = null;
            this.var_849 = null;
            for(_loc1_ in this.var_877)
            {
               _loc2_ = this.var_877[_loc1_] as BitmapData;
               _loc2_.dispose();
               delete this.var_877[_loc1_];
            }
            this.var_877 = null;
            for(_loc1_ in this.var_876)
            {
               _loc2_ = this.var_876[_loc1_] as BitmapData;
               _loc2_.dispose();
               delete this.var_876[_loc1_];
            }
            this.var_876 = null;
         }
      }
      
      override public function isStateDrawable(param1:uint) : Boolean
      {
         return false;
      }
      
      override public function draw(param1:IWindow, param2:IBitmapDrawable, param3:Rectangle, param4:uint, param5:Boolean) : void
      {
         var _loc9_:* = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Boolean = false;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:* = null;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc6_:BitmapData = param2 as BitmapData;
         var _loc7_:ISkinLayout = var_470[param4];
         var _loc8_:ISkinTemplate = _templatesByState[param4];
         if(_loc7_ == null)
         {
            Logger.log("LAYOUT NULL " + param4);
            _loc7_ = var_470["null"];
            _loc8_ = _templatesByState["null"];
         }
         _loc9_ = uint(_loc7_.numChildren);
         if(_loc7_ != null && _loc9_ > 0)
         {
            _loc14_ = param3.width - _loc7_.width;
            _loc15_ = param3.height - _loc7_.height;
            _loc16_ = !param1.background && (param1.color & 16777215) < 16777215;
            if(_loc16_)
            {
               this.var_849.redMultiplier = ((param1.color & 16711680) >> 16) / 255;
               this.var_849.greenMultiplier = ((param1.color & 65280) >> 8) / 255;
               this.var_849.blueMultiplier = (param1.color & 255) / 255;
               this.var_849.alphaMultiplier = 1;
            }
            _loc17_ = 0;
            while(_loc17_ < _loc9_)
            {
               _loc10_ = _loc7_.getChildAt(_loc17_) as SkinLayoutEntity;
               _loc11_ = _loc8_.getChildByName(_loc10_.name) as ISkinTemplateEntity;
               if(_loc11_ != null)
               {
                  _loc18_ = this.getBitmapFromCache(_loc8_,_loc10_.name);
                  _loc19_ = this.getAlphaFromCache(_loc8_,_loc10_.name);
                  if(_loc16_ && _loc10_.colorize)
                  {
                     _loc18_ = _loc18_.clone();
                     _loc18_.colorTransform(_loc18_.rect,this.var_849);
                  }
                  _loc12_ = false;
                  _loc13_ = false;
                  var_29.x = _loc10_.region.x + param3.x;
                  var_29.y = _loc10_.region.y + param3.y;
                  var_29.width = _loc10_.region.width;
                  var_29.height = _loc10_.region.height;
                  if(_loc10_.var_395 == SkinLayoutEntity.const_345)
                  {
                     var_29.x += _loc14_;
                  }
                  else if(_loc10_.var_395 == SkinLayoutEntity.const_469)
                  {
                     _loc12_ = true;
                     var_29.right += _loc14_;
                     if(true)
                     {
                        break;
                     }
                  }
                  else if(_loc10_.var_395 == SkinLayoutEntity.const_298)
                  {
                     _loc12_ = true;
                     var_29.right += _loc14_;
                     if(true)
                     {
                        break;
                     }
                  }
                  if(_loc10_.var_396 == SkinLayoutEntity.const_345)
                  {
                     var_29.y += _loc15_;
                  }
                  else if(_loc10_.var_396 == SkinLayoutEntity.const_469)
                  {
                     _loc13_ = true;
                     var_29.bottom += _loc15_;
                     if(true)
                     {
                        break;
                     }
                  }
                  else if(_loc10_.var_396 == SkinLayoutEntity.const_298)
                  {
                     _loc13_ = true;
                     var_29.bottom += _loc15_;
                     if(true)
                     {
                        break;
                     }
                  }
                  if(!_loc12_ && !_loc13_)
                  {
                     _loc6_.copyPixels(_loc18_,_loc18_.rect,var_29.topLeft,_loc19_,TOP_LEFT,true);
                  }
                  else if(_loc10_.var_396 == SkinLayoutEntity.const_298 || _loc10_.var_395 == SkinLayoutEntity.const_298)
                  {
                     _loc20_ = _loc18_.width;
                     _loc21_ = _loc18_.height;
                     _loc22_ = 0 / _loc20_;
                     _loc23_ = 0 / _loc21_;
                     _loc24_ = 0 % _loc20_;
                     _loc25_ = 0 % _loc21_;
                     _loc26_ = new Point(var_29.x,var_29.y);
                     _loc27_ = new Rectangle(0,0,_loc24_,_loc18_.height);
                     _loc28_ = new Rectangle(0,0,_loc18_.width,_loc25_);
                     _loc29_ = 0;
                     while(_loc29_ < _loc23_)
                     {
                        _loc26_.x = var_29.x;
                        _loc30_ = 0;
                        while(_loc30_ < _loc22_)
                        {
                           _loc6_.copyPixels(_loc18_,_loc18_.rect,_loc26_,_loc19_,TOP_LEFT,true);
                           _loc26_.x += _loc20_;
                           _loc30_++;
                        }
                        if(_loc24_ > 0)
                        {
                           _loc6_.copyPixels(_loc18_,_loc27_,_loc26_,_loc19_,TOP_LEFT,true);
                        }
                        _loc26_.y += _loc21_;
                        _loc29_++;
                     }
                     if(_loc25_ > 0)
                     {
                        _loc26_.x = var_29.x;
                        _loc29_ = 0;
                        while(_loc29_ < _loc22_)
                        {
                           _loc6_.copyPixels(_loc18_,_loc28_,_loc26_,_loc19_,TOP_LEFT,true);
                           _loc26_.x += _loc20_;
                           _loc29_++;
                        }
                     }
                  }
                  else if(_loc18_.width == 1 && _loc18_.height == 1)
                  {
                     this.var_277.a = var_29.width;
                     this.var_277.d = var_29.height;
                     this.var_277.tx = var_29.x;
                     this.var_277.ty = var_29.y;
                     ALPHA.alphaMultiplier = (_loc19_.getPixel32(0,0) >>> 24) / 255;
                     _loc6_.draw(_loc18_,this.var_277,ALPHA);
                  }
                  else
                  {
                     this.var_277.a = 0 / _loc18_.width;
                     this.var_277.d = 0 / _loc18_.height;
                     this.var_277.tx = 0;
                     this.var_277.ty = 0;
                     _loc31_ = new BitmapData(var_29.width,var_29.height,_loc18_.transparent);
                     _loc31_.draw(_loc18_,this.var_277);
                     _loc32_ = new BitmapData(var_29.width,var_29.height,true,0);
                     _loc32_.draw(_loc19_,this.var_277,null);
                     _loc6_.copyPixels(_loc31_,_loc31_.rect,var_29.topLeft,_loc32_,TOP_LEFT,true);
                     _loc32_.dispose();
                     _loc31_.dispose();
                  }
                  if(_loc16_ && _loc10_.colorize)
                  {
                     _loc18_.dispose();
                  }
               }
               _loc17_++;
            }
         }
      }
      
      protected function drawStaticLayoutEntity(param1:BitmapData, param2:Rectangle, param3:ISkinLayout, param4:SkinLayoutEntity, param5:ISkinTemplate, param6:ISkinTemplateEntity) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc7_:Rectangle = param4.region.clone();
         _loc7_.x += param2.x;
         _loc7_.y += param2.y;
         switch(param6.type)
         {
            case "bitmap":
               _loc8_ = this.getBitmapFromCache(param5,param4.name);
               _loc9_ = this.getAlphaFromCache(param5,param4.name);
               if(param4.var_395 == SkinLayoutEntity.const_345)
               {
                  _loc7_.x += param2.width - param3.width;
               }
               if(param4.var_396 == SkinLayoutEntity.const_345)
               {
                  _loc7_.y += param2.height - param3.height;
               }
               param1.copyPixels(_loc8_,_loc8_.rect,_loc7_.topLeft,_loc9_,null,true);
               break;
            case "fill":
               param1.fillRect(_loc7_,param4.color);
         }
      }
      
      private function getBitmapFromCache(param1:ISkinTemplate, param2:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = param2 + "@" + param1.name;
         var _loc4_:BitmapData = this.var_877[_loc3_];
         if(_loc4_ == null)
         {
            _loc5_ = param1.getChildByName(param2) as ISkinTemplateEntity;
            if(_loc5_ == null)
            {
               throw new Error("Template entity" + param2 + "not found!");
            }
            _loc6_ = BitmapDataAsset(param1.asset).content as BitmapData;
            if(_loc6_ == null)
            {
               throw new Error("Asset " + param1.asset + " not found!");
            }
            _loc4_ = new TrackedBitmapData(this,_loc5_.region.width,_loc5_.region.height,false);
            _loc4_.copyPixels(_loc6_,_loc5_.region,_loc4_.rect.topLeft);
            this.var_877[_loc3_] = _loc4_;
         }
         return _loc4_;
      }
      
      private function getAlphaFromCache(param1:ISkinTemplate, param2:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = param2 + "@" + param1.name;
         var _loc4_:BitmapData = this.var_876[_loc3_];
         if(_loc4_ == null)
         {
            _loc5_ = param1.getChildByName(param2) as ISkinTemplateEntity;
            if(_loc5_ == null)
            {
               throw new Error("Template entity" + param2 + "not found!");
            }
            _loc6_ = BitmapDataAsset(param1.asset).content as BitmapData;
            if(_loc6_ == null)
            {
               throw new Error("Asset " + param1.asset + " not found!");
            }
            _loc4_ = new TrackedBitmapData(this,_loc5_.region.width,_loc5_.region.height,true);
            _loc4_.copyChannel(_loc6_,_loc5_.region,_loc4_.rect.topLeft,BitmapDataChannel.ALPHA,BitmapDataChannel.ALPHA);
            this.var_876[_loc3_] = _loc4_;
         }
         return _loc4_;
      }
      
      private function drawBorders(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = param2.bottom - 1;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right - 1)
         {
            param1.setPixel32(_loc4_,0,param3);
            param1.setPixel32(_loc4_,_loc5_,param3);
            _loc4_++;
         }
         _loc5_ = param2.top;
         while(_loc5_ < param2.bottom - 1)
         {
            param1.setPixel32(0,_loc5_,param3);
            param1.setPixel32(_loc4_,_loc5_,param3);
            _loc5_++;
         }
      }
   }
}
