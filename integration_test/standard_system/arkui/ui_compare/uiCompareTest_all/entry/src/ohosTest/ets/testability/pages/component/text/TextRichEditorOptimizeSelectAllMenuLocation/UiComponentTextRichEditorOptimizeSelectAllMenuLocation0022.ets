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
struct UIComponentTextRichEditorOptimizeSelectAllMenuLocation0022 {
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

  private my_builder: CustomBuilder = undefined

  @Builder
  TextBuilder() {
    Row() {
      Image($r('app.media.startIcon')).width(50).height(50).margin(16)
      Column() {
        Text('文本文档.txt').fontWeight(FontWeight.Bold).fontSize(16)
        Text('123.45KB').fontColor('#8a8a8a').fontSize(12)
      }.alignItems(HorizontalAlign.Start)
    }.backgroundColor('#f4f4f4')
    .borderRadius('20')
    .width('100%')
  }

  build() {

    Column() {
      // RichEditor 组件
      Row() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan(' ', {
              style: {
                fontColor: Color.Black,
                fontSize: 15
              }
            })
          })
          .id('rich_editor_optimizeselectallmenulocation_0022')
          .width(300)
          .height(200)
          .backgroundColor(Color.White)
          .border({
            width: 2,
            color: this.currentBackgroundColor
          })
      }
      Row(){
        Button('添加图片', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0022_addImage')
          .borderRadius(8)
          .backgroundColor($r('app.color.colorRed'))
          .width(120)
          .height(40)
          .margin({top:10})
          .onClick(() => {
            this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
              imageStyle: {
                size: ['57px', '57px']
              }
            })
          })
      }
      Row(){
        Button('添加symbol', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0022_symbol')
          .borderRadius(8)
          .backgroundColor($r('app.color.colorRed'))
          .width(120)
          .height(40)
          .margin({top:10})
          .onClick(() => {
            this.controller.addSymbolSpan($r('sys.symbol.basketball_fill'), {
              style: {
                fontSize: 30,
              }
            })
          })
      }
      Row(){
        Button('添加builder', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0022_builder')
          .borderRadius(8)
          .backgroundColor($r('app.color.colorRed'))
          .width(120)
          .height(40)
          .margin({top:10})
          .onClick(() => {
            this.my_builder = () => {
              this.TextBuilder()
            }
            this.controller.addBuilderSpan(this.my_builder)
          })
      }
      Row(){
        Button('随机选择', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0022_select')
          .borderRadius(8)
          .backgroundColor($r('app.color.colorRed'))
          .width(120)
          .height(40)
          .margin({top:10})
          .onClick(() => {
            this.controller.setSelection(-1,-1, {menuPolicy: MenuPolicy.SHOW})
          })
      }

    }
    .width('100%')
    .height('100%')
  }
}