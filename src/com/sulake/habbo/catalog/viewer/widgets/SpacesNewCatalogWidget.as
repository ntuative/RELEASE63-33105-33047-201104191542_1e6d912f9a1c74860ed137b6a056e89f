package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ISelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.ProductContainer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetUpdateRoomPreviewEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class SpacesNewCatalogWidget extends ItemGridCatalogWidget implements IDisposable, ICatalogWidget, IItemGrid
   {
       
      
      private var var_195:XML;
      
      private var _groupNames:Array;
      
      private var var_209:Array;
      
      private var var_524:int = 0;
      
      private var var_815:Array;
      
      private var var_458:ISelectorWindow;
      
      private var var_104:Array;
      
      public function SpacesNewCatalogWidget(param1:IWindowContainer)
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         this._groupNames = ["wallpaper","floor","landscape"];
         this.var_209 = new Array();
         this.var_815 = [0,0,0];
         this.var_104 = ["group.walls","group.floors","group.views"];
         super(param1);
         this.var_458 = _window.findChildByName("groups") as ISelectorWindow;
         if(this.var_458)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_458.numSelectables)
            {
               _loc3_ = this.var_458.getSelectableAt(_loc2_);
               if(_loc3_ is ISelectableWindow)
               {
                  _loc3_.addEventListener(WindowEvent.const_57,this.onSelectGroup);
               }
               _loc2_++;
            }
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         super.dispose();
         for each(_loc1_ in this.var_209)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.dispose();
            }
         }
         this.var_209 = null;
      }
      
      override public function init() : Boolean
      {
         Logger.log("Init Item Group Catalog Widget (Spaces New)");
         this.createOfferGroups();
         if(!super.init())
         {
            return false;
         }
         events.addEventListener(WidgetEvent.CWE_WIDGETS_INITIALIZED,this.onWidgetsInitialized);
         this.switchCategory(this.var_104[this.var_524]);
         this.updateRoomPreview();
         return true;
      }
      
      public function onWidgetsInitialized(param1:CatalogWidgetsInitializedEvent) : void
      {
         var _loc2_:int = this.var_815[this.var_524];
         var _loc3_:Offer = this.var_209[this.var_524][_loc2_];
         this.select(_loc3_.productContainer as IGridItem);
      }
      
      public function selectIndex(param1:int) : void
      {
         var _loc2_:* = null;
         if(param1 > -1 && param1 < var_570.numGridItems)
         {
            _loc2_ = this.var_209[this.var_524][param1];
            this.select(_loc2_.productContainer as IGridItem);
         }
      }
      
      override public function select(param1:IGridItem) : void
      {
         if(param1 == null)
         {
            return;
         }
         super.select(param1);
         var _loc2_:Offer = (param1 as ProductContainer).offer;
         if(_loc2_ == null)
         {
            return;
         }
         events.dispatchEvent(new SetExtraPurchaseParameterEvent(_loc2_.productContainer.firstProduct.extraParam));
         this.var_815[this.var_524] = (this.var_209[this.var_524] as Array).indexOf(_loc2_);
         this.updateRoomPreview();
      }
      
      private function updateRoomPreview() : void
      {
         var _loc1_:int = this.var_815[0];
         var _loc2_:int = this.var_815[1];
         var _loc3_:int = this.var_815[2];
         var _loc4_:Offer = this.var_209[0][_loc1_];
         var _loc5_:Offer = this.var_209[1][_loc2_];
         var _loc6_:Offer = this.var_209[2][_loc3_];
         if(!_loc5_ || !_loc4_ || !_loc6_)
         {
            return;
         }
         events.dispatchEvent(new CatalogWidgetUpdateRoomPreviewEvent(_loc5_.productContainer.firstProduct.extraParam,_loc4_.productContainer.firstProduct.extraParam,_loc6_.productContainer.firstProduct.extraParam,64));
      }
      
      private function createOfferGroups() : Boolean
      {
         var offer:Offer = null;
         var product:IProduct = null;
         var classId:int = 0;
         var groupName:String = null;
         var index:int = 0;
         var offerCode:String = null;
         var offerPrefix:String = null;
         var offerPostfix:String = null;
         var pattern:XML = null;
         var itemData:XML = null;
         var cloneOffer:Offer = null;
         var configurationAsset:XmlAsset = page.viewer.catalog.assets.getAssetByName("configuration_catalog_spaces") as XmlAsset;
         if(configurationAsset != null)
         {
            this.var_195 = configurationAsset.content as XML;
            for each(offer in page.offers)
            {
               if(!(offer.pricingModel == Offer.const_406 || offer.pricingModel == Offer.const_393))
               {
                  continue;
               }
               product = offer.productContainer.firstProduct;
               if(product == null)
               {
                  continue;
               }
               classId = product.productClassId;
               if(!(product.productType == ProductTypeEnum.const_65 || product.productType == ProductTypeEnum.const_81))
               {
                  continue;
               }
               if(product.furnitureData == null)
               {
                  continue;
               }
               groupName = product.furnitureData.name;
               index = this._groupNames.indexOf(groupName);
               offerCode = offer.localizationId;
               offerPrefix = offerCode.split(" ")[0];
               offerPostfix = offerCode.split(" ")[1];
               if(this._groupNames.indexOf(groupName) == -1)
               {
                  this._groupNames.push(groupName);
               }
               while(this.var_209.length < this._groupNames.length)
               {
                  this.var_209.push(new Array());
               }
               switch(groupName)
               {
                  case "floor":
                     for each(pattern in this.var_195.floors.pattern)
                     {
                        for each(itemData in pattern.floor)
                        {
                           cloneOffer = offer.clone();
                           cloneOffer.productContainer.firstProduct.extraParam = itemData.@id;
                           (this.var_209[index] as Array).push(cloneOffer);
                        }
                     }
                     break;
                  case "wallpaper":
                     pattern = this.var_195.walls.pattern.(@id == offerPostfix)[0] as XML;
                     if(pattern)
                     {
                        for each(itemData in pattern.wall)
                        {
                           cloneOffer = offer.clone();
                           cloneOffer.productContainer.firstProduct.extraParam = itemData.@id;
                           (this.var_209[index] as Array).push(cloneOffer);
                        }
                     }
                     break;
                  case "landscape":
                     pattern = this.var_195.landscapes.pattern.(@id == offerPostfix)[0] as XML;
                     if(pattern)
                     {
                        for each(itemData in pattern.landscape)
                        {
                           cloneOffer = offer.clone();
                           cloneOffer.productContainer.firstProduct.extraParam = itemData.@id;
                           (this.var_209[index] as Array).push(cloneOffer);
                        }
                     }
                     break;
                  default:
                     Logger.log("[SpacesCatalogWidget] : " + groupName);
                     break;
               }
            }
            page.replaceOffers([],true);
            return true;
         }
         return false;
      }
      
      private function onSelectGroup(param1:WindowEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:ISelectableWindow = param1.target as ISelectableWindow;
         if(_loc2_)
         {
            _loc3_ = this.var_458.getSelectableIndex(_loc2_);
            Logger.log("select: " + [_loc2_.name,_loc3_]);
            this.switchCategory(_loc2_.name);
         }
      }
      
      private function switchCategory(param1:String) : void
      {
         var _loc3_:int = 0;
         if(disposed)
         {
            return;
         }
         if(!this.var_458)
         {
            return;
         }
         this.var_458.setSelected(this.var_458.getSelectableByName(param1));
         var _loc2_:int = -1;
         switch(param1)
         {
            case "group.walls":
               _loc2_ = 0;
               break;
            case "group.floors":
               _loc2_ = 1;
               break;
            case "group.views":
               _loc2_ = 2;
               break;
            default:
               _loc2_ = -1;
         }
         if(_loc2_ > -1)
         {
            if(var_392 != null)
            {
               var_392.deActivate();
            }
            var_392 = null;
            this.var_524 = _loc2_;
            if(var_570)
            {
               var_570.destroyGridItems();
            }
            page.replaceOffers(this.var_209[this.var_524],false);
            resetTimer();
            populateItemGrid();
            loadItemGridGraphics();
            if(var_210)
            {
               var_210.start();
            }
            _loc3_ = this.var_815[this.var_524];
            this.selectIndex(_loc3_);
         }
      }
   }
}
