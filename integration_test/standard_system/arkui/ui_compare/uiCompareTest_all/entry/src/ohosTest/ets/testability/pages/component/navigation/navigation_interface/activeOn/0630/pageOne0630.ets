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

@Builder
export function pageOne0630Builder(name: string, param: Object) {
  PageOne0630()
}

@Builder
function dialog0630Builder() {
  Dialog0630()
}

@CustomDialog
export struct Dialog0630 {
  controller?: CustomDialogController;

  build() {
    Column() {
      Text('Dialog')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      Text('This is a dialog')
        .fontSize(16)
        .margin({ bottom: 20 });

      Row() {
        Button('OK')
          .width(100)
          .height(40)
          .margin({ right: 10 })
          .onClick(() => {
            if (this.controller) {
              this.controller.close();
            }
          });

        Button('close dialog')
          .id('closeDialogBtn0630')
          .width(100)
          .height(40)
          .onClick(() => {
            if (this.controller) {
              this.controller.close();
            }
          });
      }
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
  }
}

@Component
export struct PageOne0630 {
  pathStack: NavPathStack = new NavPathStack();
  dialogController: CustomDialogController = new CustomDialogController({
    builder: dialog0630Builder,
    alignment: DialogAlignment.Center,
    autoCancel: true
  });

  build() {
    NavDestination() {
      Column() {
        Text('PageOne')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 });

        Button('show dialog')
          .id('showDialogBtn0630')
          .width(300)
          .height(50)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.dialogController.open();
          });
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F5F5F5')
    }
    .title('PageOne')
    .mode(NavDestinationMode.STANDARD)
    .onActive((reason: number) => {
      console.log(`testTag PageOne0630 onActive reason: ${reason}`);
    })
    .onInactive((reason: number) => {
      console.log(`testTag PageOne0630 onInActive reason: ${reason}`);
    })
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}
