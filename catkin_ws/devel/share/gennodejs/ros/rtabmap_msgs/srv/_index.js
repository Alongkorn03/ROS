
"use strict";

let DetectMoreLoopClosures = require('./DetectMoreLoopClosures.js')
let SetGoal = require('./SetGoal.js')
let GetNodeData = require('./GetNodeData.js')
let AddLink = require('./AddLink.js')
let ListLabels = require('./ListLabels.js')
let GetPlan = require('./GetPlan.js')
let GetNodesInRadius = require('./GetNodesInRadius.js')
let GetMap = require('./GetMap.js')
let CleanupLocalGrids = require('./CleanupLocalGrids.js')
let SetLabel = require('./SetLabel.js')
let RemoveLabel = require('./RemoveLabel.js')
let GetMap2 = require('./GetMap2.js')
let PublishMap = require('./PublishMap.js')
let GlobalBundleAdjustment = require('./GlobalBundleAdjustment.js')
let LoadDatabase = require('./LoadDatabase.js')
let ResetPose = require('./ResetPose.js')

module.exports = {
  DetectMoreLoopClosures: DetectMoreLoopClosures,
  SetGoal: SetGoal,
  GetNodeData: GetNodeData,
  AddLink: AddLink,
  ListLabels: ListLabels,
  GetPlan: GetPlan,
  GetNodesInRadius: GetNodesInRadius,
  GetMap: GetMap,
  CleanupLocalGrids: CleanupLocalGrids,
  SetLabel: SetLabel,
  RemoveLabel: RemoveLabel,
  GetMap2: GetMap2,
  PublishMap: PublishMap,
  GlobalBundleAdjustment: GlobalBundleAdjustment,
  LoadDatabase: LoadDatabase,
  ResetPose: ResetPose,
};
