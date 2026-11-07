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

@CustomDialog
struct CustomDialogExample {
  name: string = 'ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization0070';
  controller?: CustomDialogController;

  cancel: () => void = () => {
  }

  confirm: () => void = () => {
  }

  build() {
    Column() {
      TextInput({
        placeholder: '请输入文本',
        text: 'TextInput'
      })
        .id(this.name + '_02')
        .fontSize(30)
        .height(100)

      Button('点击关闭弹窗')
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close();
          }
        })
        .margin(20)
    }
  }
}

@Entry
@Component
struct ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization0070 {
  @State name: string = 'ArkUIComponentFunctionSpecialComponentsDialogCustomSelectInputMethodOptimization0070';
  @State message: string = this.name;
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: () => {
        this.onCancel();
        },
      confirm: () => {
        this.onAccept();
      }
    }),
    cancel: this.existApp,
    autoCancel: true,
    onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
      console.info('reason=' + JSON.stringify(dismissDialogAction.reason))
      console.info('dialog onWillDismiss')
      if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
        dismissDialogAction.dismiss();
      }
      if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
        dismissDialogAction.dismiss();
      }
    },
    alignment: DialogAlignment.Bottom,
    showInSubWindow: false,
    keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
    offset: {
      dx: 0,
      dy: -20
    },
    customStyle: false,
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

  aboutToDisappear() {
    this.dialogController = null;
  }

  onCancel() {
    console.info('Callback when the first button is clicked');
  }

  onAccept() {
    console.info('Callback when the second button is clicked');
  }

  existApp() {
    console.info('Click the callback in the blank area');
  }

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Button('click customDialog')
        .id(this.name + '_01')
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open();
          }
        })
        .backgroundColor(0x317aff)
        .margin(10)
    }
    .width('100%')
    .height('100%')
    .margin({ top: 5 })
  }
}

export {}
