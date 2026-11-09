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
import { matrix4 } from '@kit.ArkUI';

class ImageModifier implements AttributeModifier<ImageAttribute> {
  public scaleX: number = 1;
  public scaleY: number = 1;
  public centerX: number = 1;
  public centerY: number = 1;

  applyNormalAttribute(instance: ImageAttribute): void {
    let matrix2: ImageMatrix = matrix4.identity()
      .scale({
        x: this.scaleX,
        y: this.scaleY,
        centerX: this.centerX,
        centerY: this.centerY
      })
    instance.imageMatrix(matrix2);
  }
}

@Entry
@Component
struct UIComponentMediaImageSupportThumbnails0014 {
  @State name: string = 'UIComponentMediaImageSupportThumbnails0014';
  @State message: string = 'UIComponentMediaImageSupportThumbnails0014';
  @State centerX: number = 1;
  @State centerY: number = 1;
  @State scaleX: number = 1;
  @State scaleY: number = 1;
  @State modifier: ImageModifier = new ImageModifier();
  @State matrix1: ImageMatrix = matrix4.identity()
    .scale({
      x: this.scaleX,
      y: this.scaleY,
      centerX: this.centerX,
      centerY: this.centerY
    })


  build() {
    Row() {
      Column() {
        Text('===原生调用===')

        Text('png图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.png'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('jpg图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.jpg'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('jpeg图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.jpeg'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('webp图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.webp'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('gif图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.gif'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('bmp图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.bmp'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('heif图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.heif'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)
      }

      Column() {
        Button('X轴缩放-10000')
          .onClick(() => {
            this.scaleX = -10000;
            this.modifier.scaleX = -10000;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴缩放-10')
          .onClick(() => {
            this.scaleX = -10;
            this.modifier.scaleX = -10;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴缩放-0.5')
          .onClick(() => {
            this.scaleX = -0.5;
            this.modifier.scaleX = -0.5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴缩放0')
          .onClick(() => {
            this.scaleX = 0;
            this.modifier.scaleX = 0;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴缩放0.5')
          .onClick(() => {
            this.scaleX = 0.5;
            this.modifier.scaleX = 0.5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})


        Button('X轴缩放1')
          .onClick(() => {
            this.scaleX = 1;
            this.modifier.scaleX = 1;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴缩放5')
          .onClick(() => {
            this.scaleX = 5;
            this.modifier.scaleX = 5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .id(this.name + '_01')
          .size({height: '1%', width: '1%'})

        Button('X轴缩放10')
          .onClick(() => {
            this.scaleX = 10;
            this.modifier.scaleX = 10;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴缩放10000')
          .onClick(() => {
            this.scaleX = 10000;
            this.modifier.scaleX = 10000;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴缩放-10000')
          .onClick(() => {
            this.scaleY = -10000;
            this.modifier.scaleY = -10000;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴缩放-10')
          .onClick(() => {
            this.scaleY = -10;
            this.modifier.scaleY = -10;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴缩放-0.5')
          .onClick(() => {
            this.scaleY = -0.5;
            this.modifier.scaleY = -0.5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴缩放0')
          .onClick(() => {
            this.scaleY = 0;
            this.modifier.scaleY = 0;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴缩放0.5')
          .onClick(() => {
            this.scaleY = 0.5;
            this.modifier.scaleY = 0.5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .id(this.name + '_02')
          .size({height: '1%', width: '1%'})


        Button('Y轴缩放1')
          .onClick(() => {
            this.scaleY = 1;
            this.modifier.scaleY = 1;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴缩放5')
          .onClick(() => {
            this.scaleY = 5;
            this.modifier.scaleY = 5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴缩放10')
          .onClick(() => {
            this.scaleY = 10;
            this.modifier.scaleY = 10;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴缩放10000')
          .onClick(() => {
            this.scaleY = 10000;
            this.modifier.scaleY = 10000;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})
      }

      Column() {
        Button('X轴中心点-10000')
          .onClick(() => {
            this.centerX = -10000;
            this.modifier.centerX = -10000;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点-10')
          .onClick(() => {
            this.centerX = -10;
            this.modifier.centerX = -10;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点-0.5')
          .onClick(() => {
            this.centerX = -0.5;
            this.modifier.centerX = -0.5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点0')
          .onClick(() => {
            this.centerX = 0;
            this.modifier.centerX = 0;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点0.5')
          .onClick(() => {
            this.centerX = 0.5;
            this.modifier.centerX = 0.5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})


        Button('X轴中心点1')
          .onClick(() => {
            this.centerX = 1;
            this.modifier.centerX = 1;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点5')
          .onClick(() => {
            this.centerX = 5;
            this.modifier.centerX = 5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点10')
          .onClick(() => {
            this.centerX = 10;
            this.modifier.centerX = 10;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .id(this.name + '_03')
          .size({height: '1%', width: '1%'})

        Button('X轴中心点10000')
          .onClick(() => {
            this.centerX = 10000;
            this.modifier.centerX = 10000;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点-10000')
          .onClick(() => {
            this.centerY = -10000;
            this.modifier.centerY = -10000;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点-10')
          .onClick(() => {
            this.centerY = -10;
            this.modifier.centerY = -10;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点-0.5')
          .onClick(() => {
            this.centerY = -0.5;
            this.modifier.centerY = -0.5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点0')
          .onClick(() => {
            this.centerY = 0;
            this.modifier.centerY = 0;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点0.5')
          .onClick(() => {
            this.centerY = 0.5;
            this.modifier.centerY = 0.5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})


        Button('Y轴中心点1')
          .onClick(() => {
            this.centerY = 1;
            this.modifier.centerY = 1;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点5')
          .onClick(() => {
            this.centerY = 5;
            this.modifier.centerY = 5;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})
          .id(this.name + '_04')

        Button('Y轴中心点10')
          .onClick(() => {
            this.centerY = 10;
            this.modifier.centerY = 10;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点10000')
          .onClick(() => {
            this.centerY = 10000;
            this.modifier.centerY = 10000;
            this.matrix1 = matrix4.identity()
              .scale({
                x: this.scaleX,
                y: this.scaleY,
                centerX: this.centerX,
                centerY: this.centerY
              });
          })
          .size({height: '1%', width: '1%'})
      }

      Column() {
        Text('===Modifier调用===')

        Text('png图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.png'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('jpg图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.jpg'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('jpeg图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.jpeg'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('webp图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.webp'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('gif图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.gif'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('bmp图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.bmp'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('heif图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.heif'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)
      }

    }
    .width('100%')
    .height('100%')
  }
}
