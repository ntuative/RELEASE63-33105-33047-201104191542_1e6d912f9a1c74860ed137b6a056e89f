package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_1069:String;
      
      protected var var_179:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_866:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_866 = param1;
         this.var_1069 = param2;
      }
      
      public function get url() : String
      {
         return this.var_1069;
      }
      
      public function get content() : Object
      {
         return this.var_179;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_866;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_179.loaderInfo != null)
            {
               if(this.var_179.loaderInfo.loader != null)
               {
                  this.var_179.loaderInfo.loader.unload();
               }
            }
            this.var_179 = null;
            this.var_866 = null;
            this._disposed = true;
            this.var_1069 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_179 = param1 as DisplayObject;
            if(this.var_179 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_179 = DisplayAsset(param1).var_179;
            this.var_866 = DisplayAsset(param1).var_866;
            if(this.var_179 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_179 = DisplayAsset(param1).var_179;
            this.var_866 = DisplayAsset(param1).var_866;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
