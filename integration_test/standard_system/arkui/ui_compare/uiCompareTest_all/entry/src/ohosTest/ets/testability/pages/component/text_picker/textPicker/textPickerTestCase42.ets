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

@Entry
@Component
struct TextPickerTestCase42 {
  @State selectedIndex: number = 2;
  @State selectedValue: string = '选项3';
  @State operationLog: string = '等待操作...';
  @State operationCount: number = 0;
  
  private singleColumnData: string[] = [
    '选项1', '选项2', '选项3', '选项4', '选项5', 
    '选项6', '选项7', '选项8', '选项9', '选项10'
  ];

  addOperation(operation: string) {
    this.operationCount++;
    this.operationLog = `${this.operationCount}. ${operation} - 选中: ${this.selectedValue} (索引: ${this.selectedIndex})`;
  }

  build() {
    Column() {
      // 页面标题
      Row() {
        Text('📋')
          .fontSize(24)
          .margin({ right: 8 })
        
        Column() {
          Text('单列TextPicker点击下面备选项测试')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2C3E50')
          
          Text('TestCase_d98da3da5bbc4618bca575c09837928b')
            .fontSize(12)
            .fontColor('#7F8C8D')
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ bottom: 8 })

      // 当前状态显示
      Column() {
        Text('📊 当前状态')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 4 })

        Row() {
          Column() {
            Text('选中项')
              .fontSize(10)
              .fontColor('#7F8C8D')
            Text(this.selectedValue)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#3498DB')
          }
          .layoutWeight(1)

          Column() {
            Text('索引')
              .fontSize(10)
              .fontColor('#7F8C8D')
            Text(`${this.selectedIndex}`)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#E67E22')
          }
          .layoutWeight(1)

          Column() {
            Text('操作次数')
              .fontSize(10)
              .fontColor('#7F8C8D')
            Text(`${this.operationCount}`)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#9B59B6')
          }
          .layoutWeight(1)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ bottom: 4 })
      }
      .width('100%')
      .padding(8)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
      .margin({ bottom: 8 })

      // TextPicker组件
      Column() {
        Text('🎯 TextPicker组件')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 4 })

        TextPicker({ 
          range: this.singleColumnData, 
          selected: this.selectedIndex 
        })
          .id('textPicker_42')
          .width('100%')
          .height(200)
          .onChange((value: string | string[], index: number | number[]) => {
            this.selectedValue = value as string;
            this.selectedIndex = index as number;
            this.addOperation('onChange事件触发');
          })
          .onScrollStop((value: string | string[], index: number | number[]) => {
            this.selectedValue = value as string;
            this.selectedIndex = index as number;
            this.addOperation('onScrollStop事件触发');
          })
          .borderRadius(8)
          .shadow({
            radius: 4,
            color: '#1A000000',
            offsetX: 0,
            offsetY: 2
          })
      }
      .width('100%')
      .padding(8)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
      .margin({ bottom: 8 })

      // 操作日志
      Column() {
        Text('📝 操作日志')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 4 })

        Text(this.operationLog)
          .fontSize(12)
          .fontColor('#5D6D7E')
          .lineHeight(16)
          .textAlign(TextAlign.Start)
          .width('100%')
          .padding(8)
          .backgroundColor('#F8F9FA')
          .borderRadius(6)
          .border({ width: 1, color: '#E9ECEF' })
      }
      .width('100%')
      .padding(8)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
      .margin({ bottom: 8 })

      // 测试说明
      Column() {
        Text('📋 测试说明')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 4 })

        Text('1. 单列TextPicker点击下面备选项\\n2. 观察选中项变化\\n3. 验证选中项内容向下变更为所点击备选项')
          .fontSize(12)
          .fontColor('#5D6D7E')
          .lineHeight(16)
          .textAlign(TextAlign.Start)
          .width('100%')
      }
      .width('100%')
      .padding(8)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
    .padding(8)
    .justifyContent(FlexAlign.Start)
  }
}
