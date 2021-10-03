package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_184:String;
      
      private var _text:ITextWindow;
      
      private var var_302:int;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function test(param1:int) : Boolean
      {
         this._text.text = this.var_184.substring(0,param1) + "...";
         return this._text.textHeight > this.var_302;
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         this.var_184 = param1;
         this._text = param2;
         this.var_302 = param3;
      }
   }
}
