package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1346:IHabboTracking;
      
      private var var_1900:Boolean = false;
      
      private var var_2328:int = 0;
      
      private var var_1720:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1346 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1346 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1900 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2328 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1900)
         {
            return;
         }
         ++this.var_1720;
         if(this.var_1720 <= this.var_2328)
         {
            this.var_1346.track("toolbar",param1);
         }
      }
   }
}
