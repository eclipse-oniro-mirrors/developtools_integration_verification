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
    Text('backgroundBlurStyle')
      .fontSize(16)
      .margin(10)
    Text('BACKGROUND_ULTRA_THICK')
      .fontSize(14)
      .fontColor(Color.Gray)
      .margin(10)
    Text('超远距景深模糊')
      .fontSize(14)
      .fontColor(Color.Gray)
      .margin(10)
  }
  .width('100%')
  .height('100%')
  .backgroundColor(Color.White)
  .borderRadius(12)
  .padding(20)
}

@Entry
@Component
struct UiComponentPopupboxPopupGlobal0290 {
  @State placementValue: Placement = Placement.Top
  @State popupColorValue: ResourceColor | null = Color.White
  @State blurStyleValue: BlurStyle = BlurStyle.Thin
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private promptActionClass: PromptActionClass = new PromptActionClass();
  private contentNode: ComponentContent<Object> | null = null

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0290')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0290')

      Text('测试说明：\n验证 openPopup 接口 options 设置 backgroundBlurStyle 参数为 BACKGROUND_ULTRA_THICK 时')
        .fontSize(14)
        .margin({ bottom: 20 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Row() {
        Text('当前状态：')
          .fontSize(12)
        Column() {
          Text('placement:' + Number(this.placementValue))
            .fontSize(12)
            .fontColor(Color.Blue)
          Text('popupcolor:' + (this.popupColorValue === null ? 'null' : 'white'))
            .fontSize(12)
            .fontColor(Color.Blue)
          Text('backgroundBlurStyle：' + Number(this.blurStyleValue))
            .fontSize(12)
            .fontColor(Color.Blue)
            .id('target_space_status_0290')
        }
      }
      .margin({ bottom: 20 })

      Button('Test')
        .id('button_test_0290')
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info('Test button clicked')
        })

      Button('跳转')
        .id('button_jump_0290')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.placementValue = Placement.Left  // placement:3 对应 Placement.Left
          this.popupColorValue = null
          this.blurStyleValue = BlurStyle.BACKGROUND_ULTRA_THICK  // backgroundBlurStyle:6
        })

      Button('open 打开')
        .id('button_open_0290')
        .margin({ bottom: 20 })
        .onClick(() => {
          this.contentNode = new ComponentContent(this.uiContext, wrapBuilder(popupBuilder), new Params('hello', this.promptActionClass));
          
          this.promptActionClass.setPromptAction(this.promptAction);
          this.promptActionClass.setContentNode(this.contentNode);
          this.promptActionClass.setOptions({
            placement: this.placementValue,
            enableArrow: true,
            backgroundBlurStyle: this.blurStyleValue
          });
          this.promptActionClass.setIsPartialUpdate(false);
          this.promptActionClass.setTarget({ id: 'target_component_0290' });
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
      .id('target_component_0290')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundImage($r('app.media.bmptest'))
    .backgroundImageSize(ImageSize.Cover)
  }
}