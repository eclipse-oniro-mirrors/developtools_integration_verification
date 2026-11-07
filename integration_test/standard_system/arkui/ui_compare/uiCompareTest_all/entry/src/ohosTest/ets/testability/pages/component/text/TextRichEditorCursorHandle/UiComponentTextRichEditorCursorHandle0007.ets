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
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import Logger from '../../../../../test/model/Logger.ts';
import { window } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextRichEditorCursorHandle0007 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State currentFontSize: number = 16;
  @State editorPadding: number = 10;
  @State editorMargin: number = 5;
  // 支持页面旋转
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private windowClass = (this.context as common.UIAbilityContext).windowStage.getMainWindowSync()

  setOrientation(orientation: number) {
    this.windowClass.setPreferredOrientation(orientation).then(() => {
      Logger.info('setWindowOrientation: ' + orientation + ' Succeeded.')
    }).catch((err: BusinessError) => {
      Logger.info('setWindowOrientation: ' + orientation + ' Failed. Cause: ' + JSON.stringify(err))
    })
  }

  build() {
    Column({ space: 15 }) {
      Text('手柄位置不错位测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Row({ space: 10 }) {
        Button('更新文本样式', { type: ButtonType.Normal, stateEffect: true })
          .id('btn_update_style_0007')
          .borderRadius(8)
          .width(110)
          .height(35)
          .onClick(() => {
            this.currentFontSize = this.currentFontSize === 16 ? 20 : 16;
            this.controller.updateSpanStyle({
              start: 0,
              end: -1,
              textStyle: {
                fontSize: this.currentFontSize
              }
            });
          })

        Button('改变文本布局', { type: ButtonType.Normal, stateEffect: true })
          .id('btn_change_layout_0007')
          .borderRadius(8)
          .width(110)
          .height(35)
          .onClick(() => {
            this.editorPadding = this.editorPadding === 10 ? 20 : 10;
            this.editorMargin = this.editorMargin === 5 ? 15 : 5;
          })

        Button('切换横屏', { type: ButtonType.Normal, stateEffect: true })
          .id('btn_landscape_0007')
          .borderRadius(8)
          .width(110)
          .height(35)
          .onClick(() => {
            this.setOrientation(window.Orientation.LANDSCAPE)
          })

        Button('切换竖屏', { type: ButtonType.Normal, stateEffect: true })
          .id('btn_portrait_0007')
          .borderRadius(8)
          .width(110)
          .height(35)
          .onClick(() => {
            this.setOrientation(window.Orientation.PORTRAIT)
          })
      }
      .margin({ top: 10 })


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
          .id('rich_editor_cursor_handle_0007')
          .width(300)
          .height(200)
          .backgroundColor(Color.White)
          .border({ width: 1, color: Color.Gray })
      }
      .padding(this.editorPadding)
      .margin(this.editorMargin)

    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}

