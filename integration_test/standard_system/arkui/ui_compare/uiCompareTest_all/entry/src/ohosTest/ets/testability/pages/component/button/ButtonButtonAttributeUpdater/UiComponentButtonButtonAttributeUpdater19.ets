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

import { AttributeUpdater } from '@kit.ArkUI';

class MyButtonModifier extends AttributeUpdater<ButtonAttribute, ButtonInterface> {
  initializeModifier(instance: ButtonAttribute): void {
    instance.backgroundColor('#2196F3')
      .fontSize(18)
      .fontColor(Color.White)
      .width('80%')
      .height(60)
      .borderRadius(8);
  }
}

@Entry
@Component
struct UiComponentButtonButtonAttributeUpdater19 {
  private modifier: MyButtonModifier = new MyButtonModifier();
  @State updateCount: number = 0;
  @State logMessage: string = '等待更新...';
  @State originalLabel: string = '初始按钮文本';
  @State buttonType: string = 'Normal';

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('AttributeUpdater更新Button构造参数')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .backgroundColor('#FF6B35')
          .width('90%')
          .padding(15)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .margin({ top: 20 })

        Column({ space: 5 }) {
          Row({ space: 5 }) {
            Text('更新次数:')
              .fontSize(14)
              .fontWeight(FontWeight.Bolder)
              .fontStyle(FontStyle.Italic)
            Text(`${this.updateCount}`)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF6B35')
          }
          Row({ space: 5 }) {
            Text('按钮类型:')
              .fontSize(14)
              .fontWeight(FontWeight.Bolder)
              .fontStyle(FontStyle.Italic)
            Text(this.buttonType)
              .fontSize(14)
              .fontColor('#2196F3')
              .fontWeight(FontWeight.Bold)
          }
          Row({ space: 5 }) {
            Text('按钮文本:')
              .fontSize(14)
              .fontWeight(FontWeight.Bolder)
              .fontStyle(FontStyle.Italic)
            Text(this.originalLabel)
              .fontSize(14)
              .fontColor('#4CAF50')
          }
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        Column({ space: 10 }) {
          Text('测试按钮（带子节点）')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          Button({ type: ButtonType.Normal }) {
            Row({ space: 10 }) {
              Image($r('sys.media.ohos_ic_public_ok'))
                .width(24)
                .height(24)
                .fillColor(Color.White)
              Text(this.originalLabel)
                .fontSize(18)
                .fontColor(Color.White)
            }
          }
          .attributeModifier(this.modifier)
          .id('TestButton')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        Column({ space: 5 }) {
          Text('场景十一')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          Button('点击更新构造参数')
            .fontSize(16)
            .width('100%')
            .backgroundColor('#4CAF50')
            .id('UiComponentButtonButtonAttributeUpdater19')
            .labelStyle({ overflow: TextOverflow.Clip,
              maxLines: 2,
              minFontSize: 10,
              maxFontSize: 20,
              font: {
                size: 20,
                weight: FontWeight.Bolder,
                family: 'cursive',
                style: FontStyle.Italic
              }
            })
            .onClick(() => {
              this.updateCount++;
              try {
                this.modifier.updateConstructorParams('场景十一修改');
                this.logMessage = `✓ 第${this.updateCount}次更新\nlabel: "场景十一修改"\n时间: ${new Date().toLocaleTimeString()}`;
                console.log(`[AttributeUpdater] updateConstructorParams("场景十一修改")`);
              } catch (error) {
                this.logMessage = `⚠️ 更新失败: ${error.message || error}`;
                console.error(`[AttributeUpdater] Error:`, error);
              }
            })

          Button('重置状态')
            .fontSize(16)
            .width('100%')
            .backgroundColor('#FF5722')
            .onClick(() => {
              this.updateCount = 0;
              this.buttonType = 'Normal';
              this.logMessage = '状态已重置';
            })
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        Column({ space: 5 }) {
          Text('测试说明')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
          Text('1. Button带有子节点（Row + Image + Text）')
            .fontSize(12)
          Text('2. 点击"场景十一"调用updateConstructorParams')
            .fontSize(12)
          Text('3. 参数：label="场景十一修改"')
            .fontSize(12)
          Text('4. 预期：按钮文本内容不受影响')
            .fontSize(12)
            .fontColor('#FF5722')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFFDE7')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)

        Column({ space: 5 }) {
          Text('日志信息')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
          Text(this.logMessage)
            .fontSize(12)
            .fontColor('#666')
            .width('100%')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 20 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

