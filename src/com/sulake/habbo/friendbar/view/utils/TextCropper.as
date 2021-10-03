package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.ITextWindow;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TextCropper implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_533:TextField;
      
      private var var_1008:TextFormat;
      
      private var var_2950:String = "...";
      
      private var var_2949:int = 20;
      
      public function TextCropper()
      {
         super();
         this.var_533 = new TextField();
         this.var_533.autoSize = TextFieldAutoSize.LEFT;
         this.var_1008 = this.var_533.defaultTextFormat;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_533 = null;
            this._disposed = true;
         }
      }
      
      public function crop(param1:ITextWindow) : void
      {
         var _loc3_:int = 0;
         this.var_1008.font = param1.fontFace;
         this.var_1008.size = param1.fontSize;
         this.var_1008.bold = param1.bold;
         this.var_1008.italic = param1.italic;
         this.var_533.setTextFormat(this.var_1008);
         this.var_533.text = param1.getLineText(0);
         var _loc2_:int = this.var_533.textWidth;
         if(_loc2_ > param1.width)
         {
            _loc3_ = this.var_533.getCharIndexAtPoint(param1.width - this.var_2949,this.var_533.textHeight / 2);
            param1.text = param1.text.slice(0,_loc3_) + this.var_2950;
         }
      }
   }
}
