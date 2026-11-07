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

import { KeyboardAvoidMode, LengthMetrics } from '@kit.ArkUI';

@CustomDialog
struct CustomDialogExample10 {
  controller?: CustomDialogController;

  build() {
    Column() {
      Button('click me')
        .id('clickMeButton_10')
        .margin(20)
      TextInput({ placeholder: '输入框' })
        .id('textInput_10')
        .width('90%')
        .height(50)
        .margin(20)
    }
    .width('100%')
    .padding(20)
  }
}

@Entry
@Component
struct DialogAvoid10 {
  @State distanceIndex: number = 0;
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample10(),
    alignment: DialogAlignment.Bottom,
    keyboardAvoidMode: 0,
    showInSubWindow: true,
    keyboardAvoidDistance: LengthMetrics.vp(9999)
  });

  aboutToDisappear() {
    this.dialogController = null;
  }

  build() {
    Column() {
      Button('CustomDialog')
        .id('customDialogButton_10')
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open();
          }
        })
        .margin(20)

      Button(`distance 9999`)
        .id('distanceButton_10')
        .onClick(() => {
          this.distanceIndex = (this.distanceIndex + 1) % 1;
        })
        .margin(20)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

