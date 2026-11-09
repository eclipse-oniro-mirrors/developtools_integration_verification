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

import { promptAction, PromptAction, ShowActionMenuOptions } from '@kit.ArkUI';

interface ActionMenuButton {
  text: string;
  color: string;
}

interface ExtendedActionMenuOptions extends ShowActionMenuOptions {
  backgroundBlurStyle?: BlurStyle | null;
}

@Entry
@Component
struct BlurMaterialSeparatedLayer0170 {
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();

  private button1: ActionMenuButton = {
    text: '选项1',
    color: '#000000'
  };

  private button2: ActionMenuButton = {
    text: '选项2',
    color: '#000000'
  };

  private button3: ActionMenuButton = {
    text: '选项3',
    color: '#000000'
  };

  private buttons: [ActionMenuButton, ActionMenuButton, ActionMenuButton] = [this.button1, this.button2, this.button3];

  private actionMenuOptions: ExtendedActionMenuOptions = {
    title: 'ActionSheet',
    buttons: this.buttons,
    backgroundBlurStyle: BlurStyle.COMPONENT_THIN
  };

  build() {
    Column() {
      Text('actionSheet')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Button('ActionSheet')
        .id('actionSheetBtn0170')
        .width(300)
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.promptAction.showActionMenu(this.actionMenuOptions);
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F5F5F5')
  }
}

