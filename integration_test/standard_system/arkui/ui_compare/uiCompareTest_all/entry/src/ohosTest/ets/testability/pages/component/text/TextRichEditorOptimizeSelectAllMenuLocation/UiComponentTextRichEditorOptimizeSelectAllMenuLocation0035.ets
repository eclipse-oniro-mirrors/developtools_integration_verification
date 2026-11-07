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
struct UIComponentTextRichEditorOptimizeSelectAllMenuLocation0035 {
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
  // 自定义键盘组件
  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Row() {
        Button('增加特表情包').onClick(() => {
          this.controller.addTextSpan('😊',
            {
              style:
              {
                fontColor: Color.Orange
              }
            })
        })
      }

      Grid() {
        ForEach(['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'], (item: string) => {
          GridItem() {
            Button(item).width(110).onClick(() => {
              this.controller.addTextSpan(item, {
                offset: this.controller.getCaretOffset(),
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
              this.controller.setCaretOffset(this.controller.getCaretOffset() + item.toString().length)
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }



  build() {
    Column() {
      // RichEditor 组件
      Row(){
        Button('添加图片', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0035_addImage')
          .borderRadius(8)
          .backgroundColor($r('app.color.colorRed'))
          .width(120)
          .height(40)
          .margin({top:50})
          .onClick(() => {
            this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
              imageStyle: {
                size: ['57px', '57px']
              }
            })
          })
      }
      Row(){
        Button('随机选择', { type: ButtonType.Normal, stateEffect: true })
          .id('button_optimizeselectallmenulocation_0035_select')
          .borderRadius(8)
          .backgroundColor($r('app.color.colorRed'))
          .width(120)
          .height(40)
          .margin({top:50})
          .onClick(() => {
            this.controller.setSelection(20,200, {menuPolicy: MenuPolicy.SHOW})
          })
      }

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
          .id('rich_editor_optimizeselectallmenulocation_0035')
          .width(300)
          .height(200)
          .backgroundColor(Color.White)
          .customKeyboard(this.CustomKeyboardBuilder(), { supportAvoidance: this.supportAvoidance })
          .margin({top:450})
          .border({
            width: 2,
            color: this.currentBackgroundColor
          })
      }

    }
    .width('100%')
    .height('100%')
  }
}