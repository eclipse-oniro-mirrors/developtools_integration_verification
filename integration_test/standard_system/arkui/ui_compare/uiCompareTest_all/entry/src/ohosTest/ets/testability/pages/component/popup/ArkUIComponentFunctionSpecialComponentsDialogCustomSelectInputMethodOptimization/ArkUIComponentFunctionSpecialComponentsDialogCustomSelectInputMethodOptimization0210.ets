/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@kit.BasicServicesKit';
import { PromptAction, promptAction } from '@kit.ArkUI';

@Entry
@Component
struct ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization0210 {
  @State name: string = 'ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization0210';
  @State message: string = this.name;
  private ctx: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.ctx.getPromptAction();
  private dialogController: promptAction.DialogController = new promptAction.DialogController();

  private customDialogComponentId: number = 0;
  @Builder customDialogComponent() {
    Column() {
      TextInput({
        placeholder: '请输入文本',
        text: 'TextInput'
      })
        .id(this.name + '_02')
        .fontSize(30)
        .height(100)

      Row({ space: 10 }) {
        Button('通过DialogId关闭').onClick(() => {
          this.promptAction.closeCustomDialog(this.customDialogComponentId);
        })
        Button('通过DialogController关闭').onClick(() => {
          this.dialogController.close();
        })
      }
    }
    .height('100%')
    .padding(5)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Button('click customDialog')
        .id(this.name + '_01')
        .onClick(() => {
          promptAction.openCustomDialog({
            builder: () => {
              this.customDialogComponent()
            },
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info('reason' + JSON.stringify(dismissDialogAction.reason))
              console.log('dialog onWillDismiss')
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss()
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss()
              }
            },
            alignment: DialogAlignment.Bottom,
            showInSubWindow: false,
            keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
            offset: {
              dx: 0,
              dy: -20
            },
            cornerRadius: 20,
            width: 300,
            height: 300,
            borderWidth: 1,
            borderStyle: BorderStyle.Dashed,
            borderColor: Color.Blue,
            backgroundColor: Color.White,
            shadow: ({
              radius: 20,
              color: Color.Grey,
              offsetX: 50,
              offsetY: 0
            }),

          })
            .then((dialogId: number) => {
            this.customDialogComponentId = dialogId
          })
            .catch((error: BusinessError) => {
              console.error(`openCustomDialog error code is ${error.code}, message is ${error.message}`)
            })
        })
        .backgroundColor(0x317aff)
        .margin(10)
    }
    .width('100%')
    .height('100%')
    .margin({ top: 5 })
  }
}
