package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2807:String;
      
      private var var_2808:String;
      
      private var var_2806:String;
      
      public function WelcomeNotification(param1:String, param2:String, param3:String)
      {
         super();
         this.var_2807 = param1;
         this.var_2808 = param2;
         this.var_2806 = param3;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2807;
      }
      
      public function get titleLocalizationKey() : String
      {
         return this.var_2808;
      }
      
      public function get descriptionLocalizationKey() : String
      {
         return this.var_2806;
      }
   }
}
