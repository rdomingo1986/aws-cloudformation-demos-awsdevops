git config --global user.name "Domingo Ramírez"
git config --global user.email domingo@allincloudservices.com


#Demo templates https://cfn101.sa.engineering/
#Explicar Resources S3, EC2, IAM (role, policy) 01.yaml - AWS CONSOLE
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/AWS_S3.html
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/AWS_EC2.html
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/AWS_IAM.html

#Explicar AWS::CloudFormation::Interface: 02.yaml - AWS CONSOLE
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-cloudformation-interface.html

#Explicar Intrinsic functions 03.yaml - AWS CONSOLE
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html

#Explicar Outputs 04.yaml - AWS CONSOLE
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/outputs-section-structure.html


#Crear assets
aws cloudformation create-stack --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --cli-input-json file://create-stack_course-demo-assets.json --template-body file://course-demo-assets.yml

#--

#Demo layered stacks Export !ImportValue
aws cloudformation create-stack --cli-input-json file://./02-CF-layered-stacks/create-stack-vpc.json --template-body file://./02-CF-layered-stacks/vpc.yaml

aws cloudformation create-stack --capabilities CAPABILITY_IAM --cli-input-json file://./02-CF-layered-stacks/create-stack-iam.json --template-body file://./02-CF-layered-stacks/iam.yaml

aws cloudformation create-stack --cli-input-json file://./02-CF-layered-stacks/create-stack-ec2.json --template-body file://./02-CF-layered-stacks/ec2.yaml

#Demo nested stacks
aws s3 cp ./03-CF-nested-stacks/ec2.yaml s3://awsdevops-demoartifacts/ec2.yaml

aws s3 cp ./03-CF-nested-stacks/iam.yaml s3://awsdevops-demoartifacts/iam.yaml

aws s3 cp ./03-CF-nested-stacks/vpc.yaml s3://awsdevops-demoartifacts/vpc.yaml

aws cloudformation create-stack --capabilities CAPABILITY_IAM --cli-input-json file://./03-CF-nested-stacks/create-stack.json --template-body file://./03-CF-nested-stacks/main.yaml

#Demo change sets
#Explicar los comportamientos de updating
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks.html

aws cloudformation create-stack --capabilities CAPABILITY_IAM --cli-input-json file://./04-CF-change-sets/01-create-stack.json --template-body file://./04-CF-change-sets/01.yaml

#Agregar y quitar un puerto del grupo de seguridad

Agregar un EBS a la instancia
Agregar un nuevo paquete a userdata
Cambiar role
Cambiar tipo de instancia

#Demo helper scripts
aws cloudformation create-stack --cli-input-json file://./05-CF-helper-scripts/create-stack-vpc.json --template-body file://./05-CF-helper-scripts/vpc.yaml

#Demo Drift detection