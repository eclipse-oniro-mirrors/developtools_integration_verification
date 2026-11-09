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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentTextRichEditorCursorPosition0010 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };

  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private windowClass = (this.context as common.UIAbilityContext).windowStage.getMainWindowSync()

  aboutToAppear(): void {
    this.infoController.addTextSpan('点击切换横竖屏按钮，查看光标位置变化', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  setOrientation(orientation: number) {
    this.windowClass.setPreferredOrientation(orientation).then(() => {
      hilog.info(0x0000, 'TEST', 'setWindowOrientation: ' + orientation + ' Succeeded.')
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'TEST', 'setWindowOrientation: ' + orientation + ' Failed. Cause: ' + JSON.stringify(err))
    })
  }

  // 获取光标位置
  getCaretPosition() {
    try {
      let caretRect = this.controller.getCaretRect();
      if (caretRect) {
        hilog.info(0x0000, 'TEST', `光标位置: x=${caretRect.x}, y=${caretRect.y}`);

        this.infoController.deleteSpans({ start: 0, end: -1 });
        this.infoController.addTextSpan(
          `当前光标位置:\nx=${caretRect.x}, y=${caretRect.y}`,
          {
            style: {
              fontSize: 14,
              fontColor: Color.Blue
            }
          }
        );
      }
    } catch (err) {
      hilog.error(0x0000, 'TEST', '获取光标失败');
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('设备切换模式（横竖屏旋转）')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Row({ space: 10 }) {
        Button('切换横屏')
          .id('button_cursor_position_0010_landscape')
          .onClick(() => {
            this.setOrientation(window.Orientation.LANDSCAPE);
          })

        Button('切换竖屏')
          .id('button_cursor_position_0010_portrait')
          .onClick(() => {
            this.setOrientation(window.Orientation.PORTRAIT);
          })

        Button('获取光标')
          .id('button_cursor_position_0010_get_caret')
          .onClick(() => {
            this.getCaretPosition();
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

      Text('光标位置信息')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 10 })

      RichEditor(this.infoOptions)
        .id('rich_editor_cursor_position_0010_info')
        .width('100%')
        .height(80)
        .backgroundColor('#F0F0F0')
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 10 })

      Text('RichEditor组件')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.options)
        .id('rich_editor_cursor_position_0010')
        .width('100%')
        .height(150)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller.addTextSpan('点击产生光标后\n切换横竖屏\n观察光标位置变化', {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

