package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2080:int = 0;
      
      protected static const const_634:int = 1;
      
      protected static const const_1799:int = 2;
      
      protected static const const_1800:int = 3;
      
      protected static const const_127:int = 4;
      
      protected static const const_633:int = 8;
      
      protected static const const_242:int = 18;
      
      protected static const const_1801:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1839:Boolean = false;
      
      protected var var_49:BitmapDataAsset;
      
      protected var var_86:IBitmapWrapperWindow;
      
      private var var_1222:uint;
      
      protected var var_210:Timer;
      
      protected var _frame:int = 0;
      
      private var var_645:Point;
      
      protected var var_871:Boolean = false;
      
      protected var var_870:Boolean = false;
      
      public function Icon()
      {
         this.var_1222 = const_634 | const_633;
         this.var_645 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1839;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_49 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_49;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_86 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_86;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1222 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1222;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_871 = param1;
         if(this.var_871 && this.var_1839)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this.var_870 = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_1839 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_86 && !this.var_86.disposed)
         {
            if(!this.var_86.bitmap)
            {
               this.var_86.bitmap = new BitmapData(this.var_86.width,this.var_86.height,true,0);
            }
            else
            {
               this.var_86.bitmap.fillRect(this.var_86.bitmap.rect,0);
            }
            if(this.var_49 && !this.var_49.disposed)
            {
               this.var_645.x = this.var_645.y = 0;
               _loc1_ = this.var_49.content as BitmapData;
               switch(this.var_1222 & const_1800)
               {
                  case const_634:
                     this.var_645.x = this.var_86.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1799:
                     this.var_645.x = this.var_86.bitmap.width - _loc1_.width;
               }
               switch(this.var_1222 & const_1801)
               {
                  case const_633:
                     this.var_645.y = this.var_86.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_242:
                     this.var_645.y = this.var_86.bitmap.height - _loc1_.height;
               }
               this.var_86.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_645);
               this.var_86.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_210)
            {
               this.var_210 = new Timer(param2,0);
               this.var_210.addEventListener(TimerEvent.TIMER,this.method_3);
               this.var_210.start();
               this.method_3(null);
            }
            this.var_210.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_210)
            {
               this.var_210.reset();
               this.var_210.removeEventListener(TimerEvent.TIMER,this.method_3);
               this.var_210 = null;
            }
         }
      }
      
      protected function method_3(param1:TimerEvent) : void
      {
      }
   }
}
