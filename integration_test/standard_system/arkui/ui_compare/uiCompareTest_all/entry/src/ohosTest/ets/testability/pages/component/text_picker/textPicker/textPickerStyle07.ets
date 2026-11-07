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
struct TextPickerStyle07 {
  @State selectedIndex1: number = 0;
  @State selectedIndex2: number = 0;
  @State selectedIndex3: number = 0;

  build() {
    Column() {
      // 页面标题
      Text('TextPicker分割线样式测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F2937')
        .margin({ bottom: 8 })
      
      Text('验证TextPicker分割线样式配置效果')
        .fontSize(16)
        .fontColor('#6B7280')
        .margin({ bottom: 30 })

      // 主测试区域
      Column({ space: 20 }) {
        // TextPicker组件 - 配置分割线样式
        TextPicker({
          range: [
            ['早餐', '午餐', '晚餐', '夜宵'],
            ['中式', '西式', '日式', '韩式'],
            ['清淡', '重口', '甜味', '辣味']
          ],
          selected: [this.selectedIndex1, this.selectedIndex2, this.selectedIndex3]
        })
          .id('textPicker_style_07')
          .divider({
            strokeWidth: 2,
            color: Color.Blue,
            startMargin: 20,
            endMargin: 20
          })
          .onChange((value: string | string[], index: number | number[]) => {
            console.info('Picker item changed, value: ' + value + ', index: ' + index);
            if (Array.isArray(index)) {
              this.selectedIndex1 = index[0];
              this.selectedIndex2 = index[1];
              this.selectedIndex3 = index[2];
            }
          })
          .margin({ bottom: 20 })

        // 当前选中值显示
        Column({ space: 8 }) {
          Text('当前选中值：')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#374151')
          
          Row({ space: 15 }) {
            Text(`餐次: ${['早餐', '午餐', '晚餐', '夜宵'][this.selectedIndex1]}`)
              .fontSize(14)
              .fontColor('#059669')
              .padding({ left: 8, right: 8, top: 4, bottom: 4 })
              .backgroundColor('#ECFDF5')
              .borderRadius(6)
            
            Text(`菜系: ${['中式', '西式', '日式', '韩式'][this.selectedIndex2]}`)
              .fontSize(14)
              .fontColor('#DC2626')
              .padding({ left: 8, right: 8, top: 4, bottom: 4 })
              .backgroundColor('#FEF2F2')
              .borderRadius(6)
            
            Text(`口味: ${['清淡', '重口', '甜味', '辣味'][this.selectedIndex3]}`)
              .fontSize(14)
              .fontColor('#7C3AED')
              .padding({ left: 8, right: 8, top: 4, bottom: 4 })
              .backgroundColor('#F3E8FF')
              .borderRadius(6)
          }
        }
      }
      .width('100%')
      .padding(20)
      .backgroundColor('#FFFFFF')
      .borderRadius(12)
      .shadow({ radius: 8, color: '#00000010', offsetX: 0, offsetY: 2 })

      // 预期效果说明
      Column({ space: 8 }) {
        Text('预期效果')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1F2937')
        
        Text('• 分割线宽度为2px')
          .fontSize(14)
          .fontColor('#6B7280')
          .margin({ left: 8 })
        
        Text('• 分割线颜色为蓝色')
          .fontSize(14)
          .fontColor('#6B7280')
          .margin({ left: 8 })
        
        Text('• 分割线左右边距为20px')
          .fontSize(14)
          .fontColor('#6B7280')
          .margin({ left: 8 })
        
        Text('• 分割线样式符合参数配置')
          .fontSize(14)
          .fontColor('#6B7280')
          .margin({ left: 8 })
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#F9FAFB')
      .borderRadius(8)
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F3F4F6')
  }
}
