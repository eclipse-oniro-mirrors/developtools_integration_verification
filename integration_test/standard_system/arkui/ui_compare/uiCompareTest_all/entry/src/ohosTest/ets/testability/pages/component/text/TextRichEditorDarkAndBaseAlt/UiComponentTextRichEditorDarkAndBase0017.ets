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

import { ConfigurationConstant } from '@kit.AbilityKit';

@Entry
@Component
struct UiComponentTextRichEditorDarkAndBase0017 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoShowController: RichEditorController = new RichEditorController();
  infoShowOptions: RichEditorOptions = { controller: this.infoShowController };
  @StorageProp('currentColorMode') @Watch('onColorModeChange') currentMode: number =
    ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
  @State currentBackgroundColor: ResourceStr = $r('sys.color.brand');

  onColorModeChange(): void {
    if (this.currentMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  aboutToAppear(): void {
    if (this.currentMode == ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      //当前为浅色模式，资源初始化逻辑
      this.currentBackgroundColor = $r('sys.color.brand')
    } else {
      //当前为深色模式，资源初始化逻辑
      this.currentBackgroundColor = $r('sys.color.warning');
    }
  }

  build() {
    Column() {
      Row() {
        RichEditor({ controller: this.controller })
          .onReady(() => {
            this.controller.addTextSpan('一段预置的文本', {
              style: {
                fontSize: 25,
                decoration: {
                  type: TextDecorationType.LineThrough,
                  color: this.currentBackgroundColor,
                  // 设置装饰线粗细比例为6
                  thicknessScale: 6
                }
              }
            })
          })
          .width(300)
          .height(50)
          .id('rich_editor_darkandbase_0017')
          .backgroundColor(Color.White)
          .border({
            width: 2,
            color: this.currentBackgroundColor
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

    }
    .margin({ top: '20%' })
  }
}