package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2880:String;
      
      private var var_2882:Class;
      
      private var var_2881:Class;
      
      private var var_2066:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2880 = param1;
         this.var_2882 = param2;
         this.var_2881 = param3;
         if(rest == null)
         {
            this.var_2066 = new Array();
         }
         else
         {
            this.var_2066 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2880;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2882;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2881;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_2066;
      }
   }
}
