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


import { WaterFlowDataSource } from './WaterFlowDataSource';

@Entry
@Component
export struct PreviewContainer0040 {
  @State minSize: number = 80;
  @State maxSize: number = 180;
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F];
  @State columnsTemplate: string = 'repeat(auto-fill, 80)';
  @State rowsTemplate: string = '';
  @State columnsGap: number = 10;
  @State rowsGap: number = 5;
  @State layoutDirection: FlexDirection = FlexDirection.Column;
  dataSource: WaterFlowDataSource = new WaterFlowDataSource();
  private itemWidthArray: number[] = [];
  private itemHeightArray: number[] = [];

  // 计算FlowItem宽/高
  getSize(): number {
    let ret = Math.floor(Math.random() * this.maxSize);
    return (ret > this.minSize ? ret : this.minSize);
  }

  // 设置FlowItem宽/高数组
  setItemSizeArray(): void {
    for (let i = 0; i < 100; i++) {
      this.itemWidthArray.push(this.getSize());
      this.itemHeightArray.push(this.getSize());
    }
  }

  // 组件生命周期：在组件即将出现时初始化尺寸数组
  aboutToAppear(): void {
    this.setItemSizeArray();
  }

  build() {
    Column({ space: 2 }) {
      // 添加控制面板
      Row() {
        Text('WaterFlow 瀑布流布局')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(0x333333)
      }
      .width('100%')
      .padding(16)
      .backgroundColor(0xF0F0F0)
      .justifyContent(FlexAlign.Center)

      // 属性控制区域
      Column({ space: 8 }) {
        Row() {
          Text('列间距:')
            .fontSize(14)
            .width(60)
          Slider({
            value: this.columnsGap,
            min: 0,
            max: 20,
            step: 2,
            style: SliderStyle.OutSet
          })
            .width(150)
            .blockColor(0x007DFF)
            .trackColor(0xE0E0E0)
            .selectedColor(0x007DFF)
            .onChange((value: number) => {
              this.columnsGap = value;
            })
          Text(`${this.columnsGap}px`)
            .fontSize(12)
            .width(40)
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)

        Row() {
          Text('行间距:')
            .fontSize(14)
            .width(60)
          Slider({
            value: this.rowsGap,
            min: 0,
            max: 20,
            step: 1,
            style: SliderStyle.OutSet
          })
            .width(150)
            .blockColor(0x007DFF)
            .trackColor(0xE0E0E0)
            .selectedColor(0x007DFF)
            .onChange((value: number) => {
              this.rowsGap = value;
            })
          Text(`${this.rowsGap}px`)
            .fontSize(12)
            .width(40)
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 8 })
      .backgroundColor(Color.White)

      WaterFlow() {
        LazyForEach(this.dataSource, (item: number) => {
          FlowItem() {
            Column() {
              Text('N' + item)
                .fontSize(12)
                .height(16)
                .textAlign(TextAlign.Center)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
              // 存在对应的jpg文件才会显示图片
              Image('res/waterFlowTest(' + item % 5 + ').jpg')
                .width('100%')
                .objectFit(ImageFit.Cover)
                .borderRadius(4)
            }
            .padding(4)
          }
          .width('100%')
          .height(this.itemHeightArray[item % 100])
          .backgroundColor(this.colors[item % this.colors.length])
          .borderRadius(8)
          .shadow({ radius: 4, color: 0x20000000, offsetX: 0, offsetY: 2 })
        }, (item: string) => item)
      }
      // 根据官方文档设置 WaterFlow 属性
      .columnsTemplate(this.columnsTemplate)
      .rowsTemplate(this.rowsTemplate)
      .columnsGap(this.columnsGap)
      .rowsGap(this.rowsGap)
      .layoutDirection(this.layoutDirection)
      .padding({ left: 8, right: 8, top: 8, bottom: 8 })
      .backgroundColor(0xFAEEE0)
      .width('100%')
      .height('70%')
      .borderRadius(12)
      .constraintSize({ minHeight: 200, maxHeight: '80%' })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }
}
