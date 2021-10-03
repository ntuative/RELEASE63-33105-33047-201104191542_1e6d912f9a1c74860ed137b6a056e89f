package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1895:IID;
      
      private var var_1071:Boolean;
      
      private var var_1235:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1895 = param1;
         this.var_1235 = new Array();
         this.var_1071 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1895;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1071;
      }
      
      public function get receivers() : Array
      {
         return this.var_1235;
      }
      
      public function dispose() : void
      {
         if(!this.var_1071)
         {
            this.var_1071 = true;
            this.var_1895 = null;
            while(this.var_1235.length > 0)
            {
               this.var_1235.pop();
            }
            this.var_1235 = null;
         }
      }
   }
}
