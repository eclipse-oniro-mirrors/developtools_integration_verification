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

import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import { Rect } from '@kit.TestKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { display } from '@kit.ArkUI';

@Entry
@Component
struct OptimizationOfDragAndDropZoomRules005 {
  @State targetImage: string = '';
  @State targetText: string = 'Drag Text';
  @State imageWidth: number = 100;
  @State imageHeight: number = 100;
  @State imgState: Visibility = Visibility.Visible;
  @State abstractContent: string = 'abstract';
  @State textContent: string = '';
  @State backGroundColor: Color = Color.Transparent;
  private caseName: string = 'SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_016';

  getDataFromUdmfRetry(event: DragEvent, callback: (data: DragEvent) => void) {
    try {
      let data: UnifiedData = event.getData();
      if (!data) {
        return false;
      }
      let records: unifiedDataChannel.UnifiedRecord[] = data.getRecords();
      if (!records || records.length <= 0) {
        return false;
      }
      callback(event);
      return true;
    } catch (e) {
      console.log('getData failed, code = ' + (e as BusinessError).code + ', message = ' + (e as BusinessError).message);
      return false;
    }
  }

  getDataFromUdmf(event: DragEvent, callback: (data: DragEvent) => void) {
    if (this.getDataFromUdmfRetry(event, callback)) {
      return;
    }
    setTimeout(() => {
      this.getDataFromUdmfRetry(event, callback);
    }, 1500);
  }

  build() {
    Column() {
      Column() {
        Column() {
          Text('start Drag')
            .fontSize(30)
            .textAlign(TextAlign.Center)
        }
        .justifyContent(FlexAlign.Center)
        .margin(10)
        .width('100%')
        .height('10%')
        .backgroundColor(0xbdac12)
        Row() {
          Image('/icon.png')
            .width('60%')
            .aspectRatio(1)
            .draggable(true)
            .dragPreviewOptions({
              mode: DragPreviewMode.DISABLE_SCALE
            })
            .id('image1')
            .margin({ left: 10 })
            .visibility(this.imgState)
            .onDragEnd((event) => {
              if (event.getResult() === DragResult.DRAG_SUCCESSFUL) {
                this.getUIContext().getPromptAction().showToast({ duration: 100, message: 'Drag Success' });
              } else if (event.getResult() === DragResult.DRAG_FAILED) {
                this.getUIContext().getPromptAction().showToast({ duration: 100, message: 'Drag failed' });
              }
            })
        }
      }
      .width('100%')
      .margin({ bottom: '5%' })

      Column() {
        Column() {
          Text('Drag Target Area')
            .fontSize(30)
            .textAlign(TextAlign.Center)
        }
        .justifyContent(FlexAlign.Center)
        .margin(10)
        .width('100%')
        .height('10%')
        .backgroundColor(0xbdac12)
        Image(this.targetImage)
          .width(this.imageWidth)
          .height(this.imageHeight)
          .draggable(true)
          .margin({ left: 10 })
          .id('image2')
          .border({ color: Color.Black, width: 1 })
          .allowDrop([uniformTypeDescriptor.UniformDataType.IMAGE])
          .onDrop((dragEvent?: DragEvent) => {
            this.getDataFromUdmf((dragEvent as DragEvent), (event: DragEvent) =>
            {
              let records: unifiedDataChannel.UnifiedRecord[] = event.getData().getRecords();
              let rect: Rectangle = event.getPreviewRect();
              this.imageWidth = Number(rect.width);
              this.imageHeight = Number(rect.height);
              console.info(`${this.caseName} imageWidth is ${this.imageWidth}`);
              console.info(`${this.caseName} imageHeight is ${this.imageHeight}`);
              // console.info(`${this.caseName} width is ${Image.GetWidth()}`)
              this.targetImage = (records[0] as unifiedDataChannel.Image).imageUri;
              event.useCustomDropAnimation = false;
              this.imgState = Visibility.None;
              event.setResult(DragResult.DRAG_SUCCESSFUL);
            })
          })
      }
      .width('100%')
    }
    .id('screen')
    .height('100%')
    .width('100%')
  }
}
