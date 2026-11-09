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
struct UiComponentTextRichEditorAdaptiveAging0013 {
  // 创建RichEditor控制器
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoShowController: RichEditorController = new RichEditorController();
  infoShowOptions: RichEditorOptions = { controller: this.infoShowController };
  @StorageProp('currentColorMode') @Watch('onColorModeChange') currentMode: number =
    ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
  @State currentBackgroundColor: ResourceStr = $r('sys.color.brand');

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
      Scroll() {
        // RichEditor 组件
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan(
              '++++++++测试头部+++++++++\n' +
                '=======================\n' +
                '=======================\n' +
                '=======================\n' +
                '=======================\n' +
                '=======================\n' +
                '=======================\n' +
                '=======================\n' +
                '--------测试尾部--------\n',
              {
                style: {
                  fontColor: $r('sys.color.warning'),
                  fontSize: 20
                }
              })
          })
          .id('rich_editor_adaptiveAging_0013')
          .width('90%')
          .margin({ top: 100 })
          .height(150)
          .backgroundColor(Color.White)
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