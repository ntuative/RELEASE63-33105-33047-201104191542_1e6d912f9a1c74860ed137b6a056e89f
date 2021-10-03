package com.sulake.habbo.ui
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendlist.IFriend;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectOperationEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.IPetInfo;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
   import com.sulake.habbo.session.events.UserTagsReceivedEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import com.sulake.habbo.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.widget.enums.RoomWidgetInfostandExtraParamEnum;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetChatInputContentUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSongUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChangeMottoMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniActionMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetBadgeDetailsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetBadgeImageMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomTagSearchMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class InfoStandWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var var_1071:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_594:Map;
      
      private var var_73:IHabboMusicController;
      
      public function InfoStandWidgetHandler(param1:IHabboMusicController)
      {
         this.var_594 = new Map();
         super();
         this.var_73 = param1;
         if(this.var_73 != null)
         {
            this.var_73.events.addEventListener(NowPlayingEvent.const_318,this.onNowPlayingChanged);
            this.var_73.events.addEventListener(SongInfoReceivedEvent.const_98,this.onSongInfoReceivedEvent);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1071;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_576;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(this._container != null)
         {
            if(this._container.sessionDataManager != null)
            {
               this._container.sessionDataManager.events.removeEventListener(UserTagsReceivedEvent.const_166,this.onUserTags);
               this._container.sessionDataManager.events.removeEventListener(BadgeImageReadyEvent.const_151,this.onBadgeImage);
            }
            if(this._container.roomSessionManager != null)
            {
               this._container.roomSessionManager.events.removeEventListener(RoomSessionUserFigureUpdateEvent.const_181,this.onFigureUpdate);
               this._container.roomSessionManager.events.removeEventListener(RoomSessionPetInfoUpdateEvent.const_110,this.onPetInfo);
               this._container.roomSessionManager.events.removeEventListener(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
            }
         }
         this._container = param1;
         if(param1 == null)
         {
            return;
         }
         if(this._container.sessionDataManager != null)
         {
            this._container.sessionDataManager.events.addEventListener(UserTagsReceivedEvent.const_166,this.onUserTags);
            this._container.sessionDataManager.events.addEventListener(BadgeImageReadyEvent.const_151,this.onBadgeImage);
         }
         if(this._container.roomSessionManager != null)
         {
            this._container.roomSessionManager.events.addEventListener(RoomSessionUserFigureUpdateEvent.const_181,this.onFigureUpdate);
            this._container.roomSessionManager.events.addEventListener(RoomSessionPetInfoUpdateEvent.const_110,this.onPetInfo);
            this._container.roomSessionManager.events.addEventListener(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_594 != null)
         {
            _loc1_ = this.var_594.length - 1;
            while(_loc1_ >= 0)
            {
               _loc2_ = this.var_594.getWithIndex(_loc1_);
               if(_loc2_)
               {
                  _loc2_.dispose();
               }
               _loc2_ = null;
               _loc1_--;
            }
            this.var_594.dispose();
            this.var_594 = null;
         }
         if(this.var_73 != null)
         {
            this.var_73.events.removeEventListener(NowPlayingEvent.const_318,this.onNowPlayingChanged);
            this.var_73.events.removeEventListener(SongInfoReceivedEvent.const_98,this.onSongInfoReceivedEvent);
            this.var_73 = null;
         }
         this.var_1071 = true;
         this.container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetRoomObjectMessage.const_291);
         _loc1_.push(RoomWidgetUserActionMessage.const_487);
         _loc1_.push(RoomWidgetUserActionMessage.const_558);
         _loc1_.push(RoomWidgetUserActionMessage.const_546);
         _loc1_.push(RoomWidgetUserActionMessage.const_522);
         _loc1_.push(RoomWidgetUserActionMessage.const_490);
         _loc1_.push(RoomWidgetUserActionMessage.const_379);
         _loc1_.push(RoomWidgetUserActionMessage.const_480);
         _loc1_.push(RoomWidgetUserActionMessage.const_630);
         _loc1_.push(RoomWidgetUserActionMessage.const_545);
         _loc1_.push(RoomWidgetUserActionMessage.const_616);
         _loc1_.push(RoomWidgetUserActionMessage.const_941);
         _loc1_.push(RoomWidgetFurniActionMessage.const_234);
         _loc1_.push(RoomWidgetFurniActionMessage.const_796);
         _loc1_.push(RoomWidgetFurniActionMessage.const_853);
         _loc1_.push(RoomWidgetFurniActionMessage.const_809);
         _loc1_.push(RoomWidgetRoomTagSearchMessage.const_900);
         _loc1_.push(RoomWidgetGetBadgeDetailsMessage.const_775);
         _loc1_.push(RoomWidgetGetBadgeImageMessage.const_802);
         _loc1_.push(RoomWidgetUserActionMessage.const_484);
         _loc1_.push(RoomWidgetUserActionMessage.const_543);
         _loc1_.push(RoomWidgetUserActionMessage.const_556);
         _loc1_.push(RoomWidgetUserActionMessage.const_1747);
         _loc1_.push(RoomWidgetPetCommandMessage.const_485);
         _loc1_.push(RoomWidgetPetCommandMessage.const_925);
         _loc1_.push(RoomWidgetUserActionMessage.const_564);
         _loc1_.push(RoomWidgetUserActionMessage.const_429);
         _loc1_.push(RoomWidgetChangeMottoMessage.CHANGE_MOTTO);
         return _loc1_;
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         if(param1 == null)
         {
            return null;
         }
         if(this._container == null)
         {
            return null;
         }
         var _loc2_:int = 0;
         _loc4_ = param1 as RoomWidgetUserActionMessage;
         if(_loc4_ != null)
         {
            _loc2_ = _loc4_.userId;
            if(_loc4_.type == RoomWidgetUserActionMessage.const_484)
            {
               _loc3_ = this._container.roomSession.userDataManager.getUserDataByIndex(_loc2_);
            }
            else if(param1.type == RoomWidgetUserActionMessage.const_429 || param1.type == RoomWidgetUserActionMessage.const_564 || param1.type == RoomWidgetUserActionMessage.const_556)
            {
               _loc3_ = this._container.roomSession.userDataManager.getPetUserData(_loc2_);
            }
            else
            {
               _loc3_ = this._container.roomSession.userDataManager.getUserData(_loc2_);
            }
            if(_loc3_ == null)
            {
               return null;
            }
         }
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc7_ = param1 as RoomWidgetFurniActionMessage;
         if(_loc7_ != null)
         {
            _loc5_ = _loc7_.furniId;
            _loc6_ = _loc7_.furniCategory;
         }
         switch(param1.type)
         {
            case RoomWidgetRoomObjectMessage.const_291:
               return this.handleGetObjectInfoMessage(param1 as RoomWidgetRoomObjectMessage);
            case RoomWidgetUserActionMessage.const_487:
               this._container.friendList.askForAFriend(_loc2_,_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_558:
               this._container.sessionDataManager.giveRespect(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_564:
               this._container.sessionDataManager.givePetRespect(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_546:
               _loc8_ = new RoomWidgetChatInputContentUpdateEvent(RoomWidgetChatInputContentUpdateEvent.const_720,_loc3_.name);
               this._container.events.dispatchEvent(_loc8_);
               break;
            case RoomWidgetUserActionMessage.const_522:
               this._container.sessionDataManager.ignoreUser(_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_490:
               this._container.sessionDataManager.unignoreUser(_loc3_.name);
               break;
            case RoomWidgetUserActionMessage.const_379:
               this._container.roomSession.kickUser(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_480:
               this._container.roomSession.banUser(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_630:
               this._container.roomSession.assignRights(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_545:
               this._container.roomSession.removeRights(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_616:
               _loc9_ = this._container.roomSession.userDataManager.getUserData(_loc4_.userId);
               this._container.inventory.setupTrading(_loc9_.id,_loc9_.name);
               break;
            case RoomWidgetUserActionMessage.const_941:
               this._container.sessionDataManager.openHabboHomePage(_loc3_.webID);
               break;
            case RoomWidgetUserActionMessage.const_556:
               this._container.roomSession.pickUpPet(_loc2_);
               break;
            case RoomWidgetFurniActionMessage.const_796:
               this._container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_ROTATE_POSITIVE);
               break;
            case RoomWidgetFurniActionMessage.const_234:
               this._container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_MOVE);
               break;
            case RoomWidgetFurniActionMessage.const_853:
               this._container.roomEngine.modifyRoomObject(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_PICKUP);
               break;
            case RoomWidgetFurniActionMessage.const_809:
               _loc10_ = _loc7_.objectData;
               if(_loc10_ != null)
               {
                  _loc18_ = new Map();
                  _loc19_ = _loc10_.split("\t");
                  if(_loc19_ != null)
                  {
                     for each(_loc20_ in _loc19_)
                     {
                        _loc21_ = _loc20_.split("=",2);
                        if(_loc21_ != null && _loc21_.length == 2)
                        {
                           _loc22_ = _loc21_[0];
                           _loc23_ = _loc21_[1];
                           _loc18_.add(_loc22_,_loc23_);
                        }
                     }
                  }
                  this._container.roomEngine.modifyRoomObjectDataWithMap(_loc5_,_loc6_,RoomObjectOperationEnum.OBJECT_SAVE_STUFF_DATA,_loc18_);
                  if(!_loc18_.disposed)
                  {
                     _loc18_.dispose();
                  }
               }
               break;
            case RoomWidgetUserActionMessage.const_429:
               if(this._container.roomSession != null && this._container.roomSession.userDataManager != null)
               {
                  this._container.roomSession.userDataManager.requestPetInfo(_loc2_);
               }
               break;
            case RoomWidgetRoomTagSearchMessage.const_900:
               _loc11_ = param1 as RoomWidgetRoomTagSearchMessage;
               if(_loc11_ == null)
               {
                  return null;
               }
               this._container.navigator.performTagSearch(_loc11_.tag);
               break;
            case RoomWidgetGetBadgeDetailsMessage.const_775:
               _loc12_ = param1 as RoomWidgetGetBadgeDetailsMessage;
               if(_loc12_ == null)
               {
                  return null;
               }
               this._container.sessionDataManager.showGroupBadgeInfo(_loc12_.groupId);
               break;
            case RoomWidgetGetBadgeImageMessage.const_802:
               _loc13_ = param1 as RoomWidgetGetBadgeImageMessage;
               if(_loc13_ == null)
               {
                  return null;
               }
               _loc14_ = this._container.sessionDataManager.getBadgeImage(_loc13_.badgeId);
               if(_loc14_ != null)
               {
                  this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc13_.badgeId,_loc14_));
               }
               break;
            case RoomWidgetUserActionMessage.const_484:
               this._container.roomSession.kickBot(_loc2_);
               break;
            case RoomWidgetUserActionMessage.const_543:
               if(this._container == null || this._container.habboHelp == null)
               {
                  break;
               }
               if(_loc3_ == null)
               {
                  break;
               }
               this._container.habboHelp.reportUser(_loc2_,_loc3_.name);
               break;
            case RoomWidgetPetCommandMessage.const_925:
               _loc15_ = param1 as RoomWidgetPetCommandMessage;
               this._container.roomSession.requestPetCommands(_loc15_.petId);
               break;
            case RoomWidgetPetCommandMessage.const_485:
               _loc16_ = param1 as RoomWidgetPetCommandMessage;
               this._container.roomSession.sendChatMessage(_loc16_.value);
               break;
            case RoomWidgetChangeMottoMessage.CHANGE_MOTTO:
               _loc17_ = param1 as RoomWidgetChangeMottoMessage;
               this._container.roomSession.sendChangeMottoMessage(_loc17_.motto);
         }
         return null;
      }
      
      private function handleGetObjectInfoMessage(param1:RoomWidgetRoomObjectMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:int = 0;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc35_:* = false;
         var _loc36_:Boolean = false;
         var _loc37_:int = 0;
         var _loc38_:* = null;
         var _loc39_:* = null;
         var _loc40_:* = null;
         var _loc41_:int = 0;
         var _loc42_:* = null;
         _loc2_ = this._container.roomSession.roomId;
         _loc3_ = this._container.roomSession.roomCategory;
         switch(param1.category)
         {
            case RoomObjectCategoryEnum.const_27:
            case RoomObjectCategoryEnum.const_26:
               if(this._container.events == null || this._container.roomEngine == null)
               {
                  return null;
               }
               if(param1.id < 0)
               {
                  return null;
               }
               _loc4_ = 4282203453;
               _loc5_ = this._container.roomEngine.getRoomObjectImage(_loc2_,_loc3_,param1.id,param1.category,new Vector3d(180),32,null,_loc4_);
               _loc6_ = new RoomWidgetFurniInfoUpdateEvent(RoomWidgetFurniInfoUpdateEvent.const_346);
               _loc6_.id = param1.id;
               _loc6_.category = param1.category;
               _loc7_ = this._container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               _loc8_ = _loc7_.getModel();
               if(_loc8_.getString(RoomWidgetInfostandExtraParamEnum.const_413) != null)
               {
                  _loc6_.extraParam = _loc8_.getString(RoomWidgetInfostandExtraParamEnum.const_413);
               }
               _loc9_ = this._container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               if(_loc9_ == null || _loc9_.getModel() == null)
               {
                  return null;
               }
               _loc10_ = _loc9_.getType();
               if(_loc10_.indexOf("poster") == 0)
               {
                  _loc24_ = int(_loc10_.replace("poster",""));
                  _loc6_.name = "${poster_" + _loc24_ + "_name}";
                  _loc6_.description = "${poster_" + _loc24_ + "_desc}";
               }
               else
               {
                  _loc25_ = _loc9_.getModel().getNumber(RoomObjectVariableEnum.const_352);
                  if(param1.category == RoomObjectCategoryEnum.const_27)
                  {
                     _loc26_ = this._container.sessionDataManager.getFloorItemData(_loc25_);
                  }
                  else if(param1.category == RoomObjectCategoryEnum.const_26)
                  {
                     _loc26_ = this._container.sessionDataManager.getWallItemData(_loc25_);
                  }
                  if(_loc26_ != null)
                  {
                     _loc6_.name = _loc26_.title;
                     _loc6_.description = _loc26_.description;
                     _loc6_.catalogPageId = _loc26_.catalogPageId;
                     _loc6_.offerId = _loc26_.offerId;
                     if(this._container.userDefinedRoomEvents != null && param1.category == RoomObjectCategoryEnum.const_27)
                     {
                        this._container.userDefinedRoomEvents.stuffSelected(_loc9_.getId(),_loc26_.title);
                     }
                  }
               }
               if(_loc10_.indexOf("post_it") > -1)
               {
                  _loc6_.isStickie = true;
               }
               _loc6_.image = _loc5_.data;
               _loc11_ = _loc9_.getModel().getNumber(RoomObjectVariableEnum.const_1160);
               _loc12_ = _loc9_.getModel().getNumber(RoomObjectVariableEnum.const_1273);
               _loc6_.expiration = _loc11_ - (getTimer() - _loc12_) / 60000;
               _loc6_.isWallItem = param1.category == RoomObjectCategoryEnum.const_26;
               _loc6_.isRoomOwner = this._container.roomSession.isRoomOwner;
               _loc6_.isRoomController = this._container.roomSession.isRoomController;
               _loc6_.isAnyRoomController = this._container.sessionDataManager.isAnyRoomController;
               this._container.events.dispatchEvent(_loc6_);
               if(_loc6_.extraParam != null && _loc6_.extraParam.length > 0)
               {
                  _loc27_ = -1;
                  _loc28_ = "";
                  _loc29_ = "";
                  _loc30_ = "";
                  if(_loc6_.extraParam == RoomWidgetInfostandExtraParamEnum.const_751)
                  {
                     _loc31_ = this.var_73.getRoomItemPlaylist();
                     if(_loc31_ != null)
                     {
                        _loc27_ = _loc31_.nowPlayingSongId;
                        _loc30_ = "null";
                     }
                  }
                  else if(_loc6_.extraParam.indexOf(RoomWidgetInfostandExtraParamEnum.const_405) == 0)
                  {
                     _loc32_ = _loc6_.extraParam.substr(RoomWidgetInfostandExtraParamEnum.const_405.length);
                     _loc27_ = parseInt(_loc32_);
                     _loc30_ = "null";
                  }
                  if(_loc27_ != -1)
                  {
                     _loc33_ = this.var_73.getSongInfo(_loc27_);
                     if(_loc33_ != null)
                     {
                        _loc28_ = _loc33_.name;
                        _loc29_ = _loc33_.creator;
                     }
                     this._container.events.dispatchEvent(new RoomWidgetSongUpdateEvent(_loc30_,_loc27_,_loc28_,_loc29_));
                  }
               }
               break;
            case RoomObjectCategoryEnum.const_34:
               if(this._container.roomSession == null || this._container.sessionDataManager == null || this._container.events == null || this._container.roomEngine == null || this._container.friendList == null || this._container.toolbar == null)
               {
                  return null;
               }
               _loc13_ = this._container.roomSession.userDataManager.getUserDataByIndex(param1.id);
               if(_loc13_ == null)
               {
                  return null;
               }
               if(_loc13_.type == RoomObjectTypeEnum.const_188)
               {
                  this._container.roomSession.userDataManager.requestPetInfo(_loc13_.webID);
                  return null;
               }
               if(_loc13_.type == RoomObjectTypeEnum.const_203)
               {
                  _loc14_ = "null";
                  if(_loc13_.webID != this._container.sessionDataManager.userId)
                  {
                     _loc14_ = "null";
                  }
               }
               else
               {
                  if(_loc13_.type != RoomObjectTypeEnum.const_939)
                  {
                     return null;
                  }
                  _loc14_ = "null";
               }
               _loc15_ = new RoomWidgetUserInfoUpdateEvent(_loc14_);
               _loc15_.isSpectatorMode = this._container.roomSession.isSpectatorMode;
               _loc15_.name = _loc13_.name;
               _loc15_.motto = _loc13_.custom;
               _loc15_.achievementScore = _loc13_.achievementScore;
               _loc15_.webID = _loc13_.webID;
               _loc15_.userRoomId = param1.id;
               _loc16_ = new Array();
               _loc18_ = this._container.roomEngine.getRoomObject(_loc2_,_loc3_,param1.id,param1.category);
               if(_loc18_ != null)
               {
                  _loc15_.carryItem = _loc18_.getModel().getNumber(RoomObjectVariableEnum.const_482);
               }
               if(_loc14_ == RoomWidgetUserInfoUpdateEvent.const_125)
               {
                  _loc15_.realName = this._container.sessionDataManager.realName;
               }
               if(_loc14_ == RoomWidgetUserInfoUpdateEvent.const_109)
               {
                  _loc15_.canBeAskedAsFriend = this._container.friendList.canBeAskedForAFriend(_loc13_.webID);
                  _loc34_ = this._container.friendList.getFriend(_loc13_.webID);
                  if(_loc34_ != null)
                  {
                     _loc15_.realName = _loc34_.realName;
                  }
                  if(_loc18_ != null)
                  {
                     _loc39_ = _loc18_.getModel().getString(RoomObjectVariableEnum.const_692);
                     _loc15_.hasFlatControl = _loc39_ == "onlyfurniture" || _loc39_ == "useradmin" || _loc39_ == "";
                     _loc15_.canBeKicked = this._container.roomSession.isPrivateRoom;
                  }
                  _loc15_.isIgnored = this._container.sessionDataManager.isIgnored(_loc13_.name);
                  _loc15_.amIOwner = this._container.roomSession.isRoomOwner;
                  _loc15_.amIController = this._container.roomSession.isRoomController;
                  _loc15_.amIAnyRoomController = this._container.sessionDataManager.isAnyRoomController;
                  _loc15_.respectLeft = this._container.sessionDataManager.respectLeft;
                  _loc35_ = !this._container.sessionDataManager.systemShutDown;
                  _loc36_ = this._container.roomSession.isTradingRoom;
                  _loc15_.canTrade = _loc35_ && _loc36_;
                  _loc15_.canTradeReason = RoomWidgetUserInfoUpdateEvent.TRADE_REASON_OK;
                  if(!_loc35_)
                  {
                     _loc15_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_724;
                  }
                  if(!_loc36_)
                  {
                     _loc15_.canTradeReason = RoomWidgetUserInfoUpdateEvent.const_938;
                  }
                  _loc37_ = this._container.sessionDataManager.userId;
                  _loc38_ = this._container.sessionDataManager.getUserTags(_loc37_);
                  this.dispatchUserTags(_loc37_,_loc38_);
               }
               if(_loc14_ == RoomWidgetUserInfoUpdateEvent.BOT)
               {
                  _loc15_.canBeKicked = this._container.roomSession.isRoomOwner;
                  _loc16_.push(RoomWidgetUserInfoUpdateEvent.const_1727);
               }
               else
               {
                  _loc16_ = this._container.roomSession.userDataManager.getUserBadges(_loc13_.webID);
                  _loc17_ = this._container.sessionDataManager.getGroupBadgeId(int(_loc13_.groupID));
                  _loc15_.groupId = int(_loc13_.groupID);
                  _loc15_.groupBadgeId = _loc17_;
               }
               _loc15_.badges = _loc16_;
               _loc19_ = _loc13_.figure;
               _loc20_ = _loc13_.sex;
               _loc21_ = this._container.avatarRenderManager.createAvatarImage(_loc19_,AvatarScaleType.const_55,_loc20_);
               if(_loc21_ != null)
               {
                  _loc21_.setDirection(AvatarSetType.const_37,4);
                  _loc15_.image = _loc21_.getImage(AvatarSetType.const_37,true);
                  _loc21_.dispose();
               }
               this._container.events.dispatchEvent(_loc15_);
               if(_loc13_.type == RoomObjectTypeEnum.const_203)
               {
                  _loc40_ = this._container.sessionDataManager.getUserTags(_loc13_.webID);
                  this.dispatchUserTags(_loc13_.webID,_loc40_);
               }
               _loc41_ = 0;
               while(_loc41_ < _loc16_.length)
               {
                  _loc23_ = _loc16_[_loc41_];
                  _loc22_ = this._container.sessionDataManager.getBadgeImage(_loc23_);
                  if(_loc22_ != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc23_,_loc22_));
                  }
                  _loc41_++;
               }
               if(_loc17_ != null)
               {
                  _loc42_ = this._container.sessionDataManager.getGroupBadgeImage(_loc17_);
                  if(_loc42_ != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc17_,_loc42_));
                  }
               }
               break;
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionUserBadgesEvent.const_159];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         switch(param1.type)
         {
            case RoomSessionUserBadgesEvent.const_159:
               _loc2_ = param1 as RoomSessionUserBadgesEvent;
               if(_loc2_ == null)
               {
                  return;
               }
               this._container.events.dispatchEvent(new RoomWidgetUserBadgesUpdateEvent(_loc2_.userId,_loc2_.badges));
               _loc3_ = 0;
               while(_loc3_ < _loc2_.badges.length)
               {
                  _loc4_ = _loc2_.badges[_loc3_];
                  _loc5_ = this._container.sessionDataManager.getBadgeImage(_loc4_);
                  if(_loc5_ != null)
                  {
                     this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(_loc4_,_loc5_));
                  }
                  _loc3_++;
               }
               break;
         }
      }
      
      private function onUserTags(param1:UserTagsReceivedEvent) : void
      {
         this.dispatchUserTags(param1.userId,param1.tags);
      }
      
      private function dispatchUserTags(param1:int, param2:Array) : void
      {
         if(param2 == null)
         {
            return;
         }
         var _loc3_:* = false;
         if(this._container.sessionDataManager != null)
         {
            _loc3_ = param1 == this._container.sessionDataManager.userId;
         }
         if(this._container != null && this._container.events != null)
         {
            this._container.events.dispatchEvent(new RoomWidgetUserTagsUpdateEvent(param1,param2,_loc3_));
         }
      }
      
      private function onBadgeImage(param1:BadgeImageReadyEvent) : void
      {
         if(this._container != null && this._container.events != null)
         {
            this._container.events.dispatchEvent(new RoomWidgetBadgeImageUpdateEvent(param1.badgeId,param1.badgeImage));
         }
      }
      
      private function onFigureUpdate(param1:RoomSessionUserFigureUpdateEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = false;
         if(this._container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.userId < 0)
         {
            return;
         }
         var _loc2_:IUserData = this._container.roomSession.userDataManager.getUserDataByIndex(param1.userId);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.webID;
         var _loc4_:* = null;
         if(this._container.avatarRenderManager != null)
         {
            _loc5_ = this._container.avatarRenderManager.createAvatarImage(param1.figure,AvatarScaleType.const_55,param1.gender);
            if(_loc5_ != null)
            {
               _loc5_.setDirection(AvatarSetType.const_37,4);
               _loc4_ = _loc5_.getImage(AvatarSetType.const_37,true);
               _loc5_.dispose();
            }
            _loc6_ = _loc3_ == this._container.sessionDataManager.userId;
            if(this._container != null && this._container.events != null)
            {
               this._container.events.dispatchEvent(new RoomWidgetUserFigureUpdateEvent(_loc3_,_loc4_,_loc6_,param1.customInfo,param1.achievementScore));
            }
         }
      }
      
      private function onPetInfo(param1:RoomSessionPetInfoUpdateEvent) : void
      {
         var _loc8_:* = false;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc2_:IPetInfo = param1.petInfo;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IUserData = this._container.roomSession.userDataManager.getPetUserData(_loc2_.petId);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:String = _loc3_.figure;
         var _loc5_:int = this.getPetType(_loc4_);
         var _loc6_:int = this.getPetRace(_loc4_);
         var _loc7_:BitmapData = this.var_594.getValue(_loc4_) as BitmapData;
         if(_loc7_ == null)
         {
            _loc7_ = this.getPetImage(_loc4_);
            this.var_594.add(_loc4_,_loc7_);
         }
         if(this._container != null && this._container.events != null)
         {
            _loc8_ = _loc2_.ownerId == this._container.sessionDataManager.userId;
            _loc9_ = new RoomWidgetPetInfoUpdateEvent(_loc5_,_loc6_,_loc3_.name,_loc2_.petId,_loc7_,_loc8_,_loc2_.ownerId,_loc2_.ownerName,_loc3_.id);
            _loc9_.level = _loc2_.level;
            _loc9_.levelMax = _loc2_.levelMax;
            _loc9_.experience = _loc2_.experience;
            _loc9_.experienceMax = _loc2_.experienceMax;
            _loc9_.energy = _loc2_.energy;
            _loc9_.energyMax = _loc2_.energyMax;
            _loc9_.nutrition = _loc2_.nutrition;
            _loc9_.nutritionMax = _loc2_.nutritionMax;
            _loc9_.petRespect = _loc2_.respect;
            _loc9_.petRespectLeft = this._container.sessionDataManager.petRespectLeft;
            _loc9_.age = _loc2_.age;
            _loc10_ = false;
            _loc11_ = this._container.roomSession.roomId;
            _loc12_ = this._container.roomSession.roomCategory;
            _loc13_ = this._container.roomSession.userDataManager.getUserData(_loc2_.ownerId);
            if(_loc13_ != null)
            {
               _loc14_ = this._container.roomEngine.getRoomObject(_loc11_,_loc12_,_loc13_.id,RoomObjectCategoryEnum.const_34);
               if(_loc14_ != null)
               {
                  _loc15_ = _loc14_.getModel().getString(RoomObjectVariableEnum.const_692);
                  _loc10_ = (this._container.roomSession.isRoomOwner || this._container.roomSession.isRoomController || this._container.sessionDataManager.isAnyRoomController) && _loc15_ != "useradmin" && this._container.roomSession.isPrivateRoom && !_loc8_;
               }
            }
            _loc9_.canOwnerBeKicked = _loc10_;
            this._container.events.dispatchEvent(_loc9_);
         }
      }
      
      private function onPetCommands(param1:RoomSessionPetCommandsUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(this._container != null && this._container.events != null)
         {
            _loc2_ = new RoomWidgetPetCommandsUpdateEvent(param1.petId,param1.allCommands,param1.enabledCommands);
            this._container.events.dispatchEvent(_loc2_);
         }
      }
      
      public function update() : void
      {
      }
      
      private function getPetImage(param1:String) : BitmapData
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = this.getPetType(param1);
         if(_loc3_ < 8)
         {
            _loc4_ = this._container.avatarRenderManager.createPetImageFromFigure(param1,AvatarScaleType.const_55,null);
            if(_loc4_ != null)
            {
               _loc2_ = _loc4_.getCroppedImage(AvatarSetType.const_37);
               _loc4_.dispose();
            }
         }
         else
         {
            _loc5_ = this.getPetRace(param1);
            _loc6_ = 0;
            _loc7_ = this._container.roomEngine.getPetImage(_loc3_,_loc5_,new Vector3d(90),64,null,_loc6_);
            if(_loc7_ != null)
            {
               _loc2_ = _loc7_.data;
            }
         }
         if(_loc2_ == null)
         {
            _loc2_ = new BitmapData(30,30,false,4289374890);
         }
         return _loc2_;
      }
      
      private function getPetType(param1:String) : int
      {
         return this.getSpaceSeparatedInteger(param1,0);
      }
      
      private function getPetRace(param1:String) : int
      {
         return this.getSpaceSeparatedInteger(param1,1);
      }
      
      private function getSpaceSeparatedInteger(param1:String, param2:int) : int
      {
         var _loc3_:* = null;
         if(param1 != null)
         {
            _loc3_ = param1.split(" ");
            if(_loc3_.length > param2)
            {
               return int(_loc3_[param2]);
            }
         }
         return -1;
      }
      
      private function onNowPlayingChanged(param1:NowPlayingEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_73 != null)
         {
            _loc2_ = param1.id;
            _loc3_ = "";
            _loc4_ = "";
            if(_loc2_ != -1)
            {
               _loc5_ = this.var_73.getSongInfo(_loc2_);
               if(_loc5_ != null)
               {
                  _loc3_ = _loc5_.name;
                  _loc4_ = _loc5_.creator;
               }
            }
            this._container.events.dispatchEvent(new RoomWidgetSongUpdateEvent(RoomWidgetSongUpdateEvent.const_407,_loc2_,_loc3_,_loc4_));
         }
      }
      
      private function onSongInfoReceivedEvent(param1:SongInfoReceivedEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_73 != null)
         {
            _loc2_ = this.var_73.getSongInfo(param1.id);
            if(_loc2_ != null)
            {
               this._container.events.dispatchEvent(new RoomWidgetSongUpdateEvent(RoomWidgetSongUpdateEvent.const_372,param1.id,_loc2_.name,_loc2_.creator));
            }
         }
      }
   }
}
