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
  promptActionClass: PromptActionClass = new PromptActionClass();

  constructor(text: string, promptActionClass: PromptActionClass) {
    this.text = text;
    this.promptActionClass = promptActionClass;
  }
}

@Builder
function popupBuilder(params: Params) {
  Column() {
    Text('Popup 内容')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .margin(10)
    Text('id 为 string 但不唯一')
      .fontSize(16)
      .margin(10)
    Text('使用 componentId 唯一标识')
      .fontSize(14)
      .fontColor(Color.Gray)
      .margin(10)
    Button('Update')
      .margin({ top: 10 })
      .width(100)
      .id('button_update_popup_0200')
      .onClick(() => {
        params.promptActionClass.updatePopup({
          backgroundBlurStyle: BlurStyle.Thin
        });
      })
    Button('Close')
      .margin({ top: 10 })
      .width(100)
      .id('button_close_popup_0200')
      .onClick(() => {
        params.promptActionClass.closePopup();
      })
  }
  .width('100%')
  .height('100%')
  .backgroundColor(Color.White)
  .borderRadius(12)
  .padding(20)
}

@Entry
@Component
struct UiComponentPopupboxPopupGlobal0200 {
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private promptActionClass: PromptActionClass = new PromptActionClass();
  private contentNode: ComponentContent<Object> | null = null
  private componentId3: number = 0

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0200')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0200')

      Text('测试说明：\n验证 openPopup 接口设置 target 参数（id 为 string 类型但不唯一，使用 componentId）时')
        .fontSize(14)
        .margin({ bottom: 20 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('Popup9')
        .id('button_popup9_0200')
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info('Popup9 button clicked')
        })

      Button('Open Popup3, componentId 唯一')
        .id('button_open_popup3_0200')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.contentNode = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder), new Params('hello', this.promptActionClass));
          
          let frameNode = this.uiContext.getFrameNodeById('target_component');
          this.componentId3 = frameNode?.getUniqueId() || 0;
          
          this.promptActionClass.setPromptAction(this.promptAction);
          this.promptActionClass.setContentNode(this.contentNode);
          this.promptActionClass.setOptions({
            placement: Placement.Bottom,
            enableArrow: true
          });
          this.promptActionClass.setIsPartialUpdate(true);
          this.promptActionClass.setTarget({ id: 'target_component', componentId: this.componentId3 });
          this.promptActionClass.openPopup();
        })

      Column() {
        Text('Popup3')
          .fontSize(18)
          .margin(10)
      }
      .width('20.83%')
      .height('8.2%')
      .backgroundColor('#FFFFE0E0')
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .id('target_component')

      Column() {
        Text('Popup3 (重名)')
          .fontSize(18)
          .margin(10)
      }
      .width('20.83%')
      .height('8.2%')
      .backgroundColor('#FFE0FFE0')
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .margin({ top: 20 })
      .id('target_component')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}