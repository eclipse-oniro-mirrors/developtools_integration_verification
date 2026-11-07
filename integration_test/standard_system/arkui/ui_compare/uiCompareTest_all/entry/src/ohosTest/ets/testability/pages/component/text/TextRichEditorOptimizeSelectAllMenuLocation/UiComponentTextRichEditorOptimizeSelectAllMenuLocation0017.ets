/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ConfigurationConstant, } from '@kit.AbilityKit';

@Entry
@Component
struct UIComponentTextRichEditorOptimizeSelectAllMenuLocation0017 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoShowController: RichEditorController = new RichEditorController();
  infoShowOptions: RichEditorOptions = { controller: this.infoShowController };
  // 支持颜色模式切换
  @StorageProp('currentColorMode') @Watch('onColorModeChange') currentMode: number =
    ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
  @State currentBackgroundColor: ResourceStr = $r('sys.color.brand');
  // 支持键盘避让
  @State supportAvoidance: boolean = true;
  // 页面输入文本数
  @State textLongth: number = 0;

  // 打开页面时初始资源
  aboutToAppear(): void {
    if (this.currentMode == ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      // 浅色模式资源初始化
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      // 浅色模式资源初始化
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  // 切换颜色模式
  onColorModeChange(): void {
    if (this.currentMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  build() {

    Column() {

      Row() {
        Button('添加图片', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0017_addImage')
          .borderRadius(8)
          .width(80)
          .height(40)
          .margin({ top: 50, left: 20 })
          .onClick(() => {
            this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
              imageStyle: {
                size: ['57px', '57px']
              }
            })
            this.textLongth = this.controller.getCaretOffset()
          })

        Button('选择底部', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0017_selectBottom')
          .borderRadius(8)
          .width(80)
          .height(40)
          .margin({ top: 50, left: 20 })
          .onClick(() => {
            this.controller.setSelection(this.textLongth - 20, this.textLongth - 1, { menuPolicy: MenuPolicy.SHOW })
          })

        Button('选择中部', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0017_selectMid')
          .borderRadius(8)
          .width(80)
          .height(40)
          .margin({ top: 50, left: 20 })
          .onClick(() => {
            this.controller.setSelection(this.textLongth / 2 + 20, this.textLongth / 2, { menuPolicy: MenuPolicy.SHOW })
          })

        Button('选择顶部', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0017_selectTop')
          .borderRadius(8)
          .width(80)
          .height(40)
          .margin({ top: 50, left: 20 })
          .onClick(() => {
            this.controller.setSelection(0, 20, { menuPolicy: MenuPolicy.SHOW })
          })


      }

      // RichEditor 组件
      Row() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan(' ', {
              style: {
                fontColor: Color.Black,
                fontSize: 30
              }
            })
          })
          .id('rich_editor_optimizeselectallmenulocation_0017')
          .width('100%')
          .height(300)
          .border({
            width: 2,
            color: this.currentBackgroundColor
          })
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      }

    }
    .width('100%')
    .height('100%')

  }
}