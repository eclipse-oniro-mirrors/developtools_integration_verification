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
import { ComponentContent, PromptAction, TargetInfo } from '@kit.ArkUI';

class PromptActionClass {
  private promptAction: PromptAction | null = null;
  private contentNode: ComponentContent<Object> | null = null;
  private options: PopupCommonOptions | null = null;
  private target: TargetInfo | null = null;
  private isPartialUpdate: boolean|undefined = false;

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
    if (this.promptAction != null) {
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
    if (this.promptAction != null) {
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
    if (this.promptAction != null) {
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
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(20)
      .margin({ top: 10 })
    Button('Update')
      .margin({ top: 10 })
      .width(100)
      .onClick(() => {
        params.promptActionClass.updatePopup({
          autoCancel:true
        });
      })
    Button('Close')
      .margin({ top: 10 })
      .id('UiComponentPopupBoxPopupGlobal92_02')
      .width(100)
      .onClick(() => {
        params.promptActionClass.closePopup();
      })
  }
  .width('100%')
  .height('100%')
}

@Entry
@Component
struct UiComponentPopupBoxPopupGlobal92 {
  @State message: string = 'hello';
  @State rotateAngle: number = 0;
  @State isRotating: boolean = false;
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private promptActionClass: PromptActionClass = new PromptActionClass();
  private contentNode: ComponentContent<Object> =
    new ComponentContent(this.uiContext, wrapBuilder(buildText), new Params(this.message, this.promptActionClass));
  private options: PopupCommonOptions = {
    followTransformOfTarget:undefined,
    placement:Placement.Bottom
  };

  build() {
    Column({ space: 30 }) {
      Text('openPopup set followTransformOfTarget to undefined')
        .fontSize(20)
        .margin({ top: 30, bottom: 20 })
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)

      Button('openPopup')
        .margin({ top: 20 })
        .id('UiComponentPopupBoxPopupGlobal92')
        .rotate({ angle: this.rotateAngle })
        .onClick(() => {
          this.rotateAngle += 90;
          let frameNode: FrameNode | null = this.uiContext.getFrameNodeById('UiComponentPopupBoxPopupGlobal92');
          if (frameNode) {
            let systemUniqueId = frameNode.getUniqueId();
            console.info('开发者ID: targetButton, 系统UniqueId: ' + systemUniqueId);
            this.promptActionClass.setPromptAction(this.promptAction);
            this.promptActionClass.setContentNode(this.contentNode);
            this.promptActionClass.setOptions(this.options);
            this.promptActionClass.setTarget({ id: systemUniqueId });
            this.promptActionClass.openPopup();
          } else {
            console.error('无法找到目标按钮');
          }
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}
