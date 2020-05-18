package kabam.rotmg.ui.view
{
   import com.company.assembleegameclient.mapeditor.MapEditor;
import com.company.assembleegameclient.parameters.Parameters;

import kabam.rotmg.account.core.signals.OpenAccountInfoSignal;
   import kabam.rotmg.core.model.PlayerModel;
   import kabam.rotmg.core.signals.SetScreenSignal;
   import kabam.rotmg.core.signals.SetScreenWithValidDataSignal;
   import kabam.rotmg.dialogs.control.OpenDialogSignal;
   import kabam.rotmg.legends.view.LegendsView;
   import kabam.rotmg.ui.signals.EnterGameSignal;
   import robotlegs.bender.bundles.mvcs.Mediator;
   
   public class TitleMediator extends Mediator
   {
      [Inject]
      public var view:TitleView;
      
      [Inject]
      public var playerModel:PlayerModel;
      
      [Inject]
      public var setScreen:SetScreenSignal;
      
      [Inject]
      public var setScreenWithValidData:SetScreenWithValidDataSignal;
      
      [Inject]
      public var enterGame:EnterGameSignal;
      
      [Inject]
      public var openAccountInfo:OpenAccountInfoSignal;
      
      [Inject]
      public var openDialog:OpenDialogSignal;
      
      public function TitleMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.initialize();
         this.view.playClicked.add(this.handleIntentionToPlay);
         this.view.accountClicked.add(this.handleIntentionToReviewAccount);
         this.view.legendsClicked.add(this.showLegendsScreen);
         this.view.editorClicked.add(this.showMapEditor);
      }
      
      override public function destroy() : void
      {
         this.view.playClicked.remove(this.handleIntentionToPlay);
         this.view.accountClicked.remove(this.handleIntentionToReviewAccount);
         this.view.legendsClicked.remove(this.showLegendsScreen);
         this.view.editorClicked.remove(this.showMapEditor);
      }
      
      private function handleIntentionToPlay() : void
      {
         this.enterGame.dispatch();
      }
      
      private function handleIntentionToReviewAccount() : void
      {
         this.openAccountInfo.dispatch(false);
      }
      
      private function showLegendsScreen() : void
      {
         this.setScreen.dispatch(new LegendsView());
      }
      
      private function showMapEditor() : void
      {
         this.setScreen.dispatch(new MapEditor());
      }
   }
}
