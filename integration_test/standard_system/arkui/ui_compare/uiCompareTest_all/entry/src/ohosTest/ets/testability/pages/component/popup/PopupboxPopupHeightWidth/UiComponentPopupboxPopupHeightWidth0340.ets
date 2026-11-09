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

import { ComponentContent, FrameNode, PromptAction, TargetInfo } from '@kit.ArkUI';
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
    if (this.promptAction != null && this.contentNode != null && this.target != null && this.options != null) {
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
    Text('这是一段较长的文本内容用来测试popup宽度自适应效果，占栅格数大于4小于480vp')
      .fontSize(16)
      .margin(10)
    Button('Close')
      .margin({ top: 10 })
      .width(100)
      .id('button_popup_0340_close')
      .onClick(() => {
        params.promptActionClass.closePopup();
      })
  }
  .backgroundColor(Color.White)
  .borderRadius(12)
  .padding(20)
}

@Entry
@Component
struct UiComponentPopupboxPopupHeightWidth0340 {
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private promptActionClass: PromptActionClass = new PromptActionClass();
  private contentNode: ComponentContent<Object> | null = null

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0340')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0340')

      Text('测试说明：\npopup 新增宽度属性，PopupOptions 参数 width 不设置宽度，输入较长文本 1 (占栅格数大于 4 小于 480vp)')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('Open Popup')
        .id('button_popup_0340_open')
        .margin({ bottom: 10 })
        .onClick(() => {
          let frameNode: FrameNode | null = this.uiContext.getFrameNodeById('target_component_0340');
          let targetId = frameNode?.getUniqueId() || 0;

          this.contentNode = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder), new Params('hello', this.promptActionClass));

          this.promptActionClass.setPromptAction(this.promptAction);
          this.promptActionClass.setContentNode(this.contentNode);
          this.promptActionClass.setOptions({
            placement: Placement.Bottom,
            enableArrow: true,
            arrowOffset: 0
          });
          this.promptActionClass.setIsPartialUpdate(true);
          this.promptActionClass.setTarget({ id: 'target_component_0340', componentId: targetId });
          this.promptActionClass.openPopup();
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
      .id('target_component_0340')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
