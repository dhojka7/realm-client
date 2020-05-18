package kabam.rotmg.ui.view
{
   import com.company.assembleegameclient.mapeditor.MapEditor;
   import kabam.rotmg.core.model.PlayerModel;
   import robotlegs.bender.bundles.mvcs.Mediator;
   
   public class MapEditorMediator extends Mediator
   {
       
      
      [Inject]
      public var view:MapEditor;
      
      [Inject]
      public var model:PlayerModel;
      
      public function MapEditorMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.initialize(this.model);
      }
   }
}
