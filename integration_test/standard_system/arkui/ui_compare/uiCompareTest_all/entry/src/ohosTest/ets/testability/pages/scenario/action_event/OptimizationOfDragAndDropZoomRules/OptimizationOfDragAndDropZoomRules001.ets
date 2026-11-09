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
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct OptimizationOfDragAndDropZoomRules001 {
  @State targetImage: string = '';
  @State targetText: string = 'Drag Text';
  @State imageWidth: number = 100;
  @State imageHeight: number = 100;
  @State imgState: Visibility = Visibility.Visible;
  @State abstractContent: string = 'abstract';
  @State textContent: string = '';
  @State backGroundColor: Color = Color.Transparent;

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
    Row() {
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
        Text('东城高且长，逶迤自相属。回风动地起，秋草萋已绿。四时更变化，岁暮一何速！晨风怀苦心，蟋蟀伤局促。' +
          '荡涤放情志，何为自结束！燕赵多佳人，美者颜如玉。被服罗裳衣，当户理清曲。音响一何悲！弦急知柱促。' +
          '驰情整巾带，沉吟聊踯躅。思为双飞燕，衔泥巢君屋。——两汉·佚名《东城高且长》')
          .width('100%')
          .height('80%')
          .textAlign(TextAlign.Center)
          .draggable(true)
          .margin({ left: 15 })
          .copyOption(CopyOptions.InApp)
          .id('text1')
      }.width('45%')
      .height('100%')

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

        Text(this.targetText)
          .width('100%')
          .height('80%')
          .border({ color: Color.Black, width: 1 })
          .margin(15)
          .id('text2')
          .allowDrop([uniformTypeDescriptor.UniformDataType.PLAIN_TEXT])
          .onDrop((dragEvent?: DragEvent) => {
            this.getDataFromUdmf((dragEvent as DragEvent), (event: DragEvent) => {
              let records: unifiedDataChannel.UnifiedRecord[] = event.getData().getRecords();
              let plainText: unifiedDataChannel.PlainText = records[0] as unifiedDataChannel.PlainText;
              this.targetText = plainText.textContent;
            });
          })
      }.width('45%')
      .height('100%')
      .margin({ left: '5%' })
    }
    .height('100%')
  }
}
