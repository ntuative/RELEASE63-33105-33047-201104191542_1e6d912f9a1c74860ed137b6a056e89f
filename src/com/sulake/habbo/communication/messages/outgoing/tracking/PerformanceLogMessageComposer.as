package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2198:int = 0;
      
      private var var_1563:String = "";
      
      private var var_1994:String = "";
      
      private var var_2555:String = "";
      
      private var var_2556:String = "";
      
      private var var_1884:int = 0;
      
      private var var_2558:int = 0;
      
      private var var_2559:int = 0;
      
      private var var_1565:int = 0;
      
      private var var_2557:int = 0;
      
      private var var_1562:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2198 = param1;
         this.var_1563 = param2;
         this.var_1994 = param3;
         this.var_2555 = param4;
         this.var_2556 = param5;
         if(param6)
         {
            this.var_1884 = 1;
         }
         else
         {
            this.var_1884 = 0;
         }
         this.var_2558 = param7;
         this.var_2559 = param8;
         this.var_1565 = param9;
         this.var_2557 = param10;
         this.var_1562 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2198,this.var_1563,this.var_1994,this.var_2555,this.var_2556,this.var_1884,this.var_2558,this.var_2559,this.var_1565,this.var_2557,this.var_1562];
      }
   }
}
