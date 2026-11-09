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

import { ComponentContent, PromptAction, TargetInfo } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export class PromptActionClass {
  private promptAction: PromptAction | null = null;
  private contentNode: ComponentContent<Object> | null = null;
  private options: PopupCommonOptions | null = null;
  private target: TargetInfo | null = null;
  private isPartialUpdate: boolean = false;

  public setPromptAction(promptAction: PromptAction) {
    this.promptAction = promptAction;
  }

  public setContentNode(node: ComponentContent<Object>) {
    this.contentNode = node;
  }

  public setTarget(target: TargetInfo) {
    this.target = target;
  }

  public setOptions(options: PopupCommonOptions) {
    this.options = options;
  }

  public setIsPartialUpdate(isPartialUpdate: boolean) {
    this.isPartialUpdate = isPartialUpdate;
  }

  public openPopup() {
    if (this.promptAction != null && this.contentNode != null) {
      this.promptAction.openPopup(this.contentNode, this.target, this.options)
        .then(() => {
          console.info('openPopup success');
        })
        .catch((err: BusinessError) => {
          console.error('openPopup error: ' + err.code + ' ' + err.message);
        })
    }
  }

  public closePopup() {
    if (this.promptAction != null && this.contentNode != null) {
      this.promptAction.closePopup(this.contentNode)
        .then(() => {
          console.info('closePopup success');
        })
        .catch((err: BusinessError) => {
          console.error('closePopup error: ' + err.code + ' ' + err.message);
        })
    }
  }

  public updatePopup(options: PopupCommonOptions) {
    if (this.promptAction != null && this.contentNode != null) {
      this.promptAction.updatePopup(this.contentNode, options, this.isPartialUpdate)
        .then(() => {
          console.info('updatePopup success');
        })
        .catch((err: BusinessError) => {
          console.error('updatePopup error: ' + err.code + ' ' + err.message);
        })
    }
  }
}

class Params {
  public text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function popupBuilder(params: Params) {
  Column() {
    Text('命令式 Popup')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin(10)
    Text(params.text)
      .fontSize(16)
      .margin(10)
  }
  .width('100%')
  .height('100%')
  .backgroundColor('#FFFFE0')
  .borderRadius(12)
  .padding(20)
}

@Builder
function sheetBuilder(uiContext: UIContext, promptAction: PromptAction) {
  Column() {
    Text('半模态内容')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin(20)
    
    Button('弹出气泡')
      .id('button_show_popup_1130')
      .margin({ top: 20, bottom: 20 })
      .onClick(() => {
        let promptActionClass = new PromptActionClass();
        let contentNode = new ComponentContent(uiContext, wrapBuilder(popupBuilder), new Params('半模态中的Popup'));
        
        promptActionClass.setPromptAction(promptAction);
        promptActionClass.setContentNode(contentNode);
        promptActionClass.setOptions({
          placement: Placement.Bottom,
          enableArrow: true
        });
        promptActionClass.setIsPartialUpdate(false);
        promptActionClass.setTarget({ id: 'sheet_target_1130' });
        promptActionClass.openPopup();
        
        // 3秒后更新popup
        setTimeout(() => {
          promptActionClass.updatePopup({
            placement: Placement.Top,
            enableArrow: true,
            width: 300
          });
        }, 3000);
        
        // 再过3秒关闭popup
        setTimeout(() => {
          promptActionClass.closePopup();
        }, 6000);
      })
    
    Column() {
      Text('目标组件')
        .fontSize(18)
        .margin(10)
    }
    .width('20.83%')
    .height('8.2%')
    .backgroundColor('#FFE0E0FF')
    .borderRadius(8)
    .justifyContent(FlexAlign.Center)
    .id('sheet_target_1130')
  }
  .width('100%')
  .height('60%')
  .padding(20)
}

@Entry
@Component
struct UiComponentPopupboxPopupGlobal1130 {
  @State isSheetVisible: boolean = false
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1130')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_1130')

      Text('测试说明：\n验证在半模态里面调用 openPopup、updatePopup、closePopup 接口')
        .fontSize(14)
        .margin({ bottom: 20 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('Popup3')
        .id('button_popup3_1130')
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info('Popup3 button clicked')
        })

      Button('bindSheet')
        .id('button_bindsheet_1130')
        .margin({ bottom: 20 })
        .bindSheet(this.isSheetVisible, sheetBuilder(this.uiContext, this.promptAction), {
          height: 600
        })
        .onClick(() => {
          this.isSheetVisible = true;
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
