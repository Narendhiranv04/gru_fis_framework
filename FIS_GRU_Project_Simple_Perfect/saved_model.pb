��
��
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
�
BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
$
DisableCopyOnRead
resource�
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
�
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	"
grad_abool( "
grad_bbool( 
�
Max

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �
?
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
f
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx" 
Tidxtype0:
2
	
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
d
Shape

input"T&
output"out_type��out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
L

StringJoin
inputs*N

output"

Nint("
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
�
TensorListFromTensor
tensor"element_dtype
element_shape"
shape_type/
output_handle���element_dtype"
element_dtypetype"

shape_typetype:
2	
�
TensorListReserve
element_shape"
shape_type
num_elements(
handle���element_dtype"
element_dtypetype"

shape_typetype:
2	
�
TensorListStack
input_handle
element_shape
tensor"element_dtype"
element_dtypetype" 
num_elementsint���������
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
�
VarHandleOp
resource"
	containerstring "
shared_namestring "

debug_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �
9
VarIsInitializedOp
resource
is_initialized
�
�
While

input2T
output2T"
T
list(type)("
condfunc"
bodyfunc" 
output_shapeslist(shape)
 "
parallel_iterationsint
�"serve*2.18.02v2.18.0-rc2-4-g6550e4bd8028��
�
gru_1/gru_cell/biasVarHandleOp*
_output_shapes
: *$

debug_namegru_1/gru_cell/bias/*
dtype0*
shape:	�*$
shared_namegru_1/gru_cell/bias
|
'gru_1/gru_cell/bias/Read/ReadVariableOpReadVariableOpgru_1/gru_cell/bias*
_output_shapes
:	�*
dtype0
�
#Variable/Initializer/ReadVariableOpReadVariableOpgru_1/gru_cell/bias*
_class
loc:@Variable*
_output_shapes
:	�*
dtype0
�
VariableVarHandleOp*
_class
loc:@Variable*
_output_shapes
: *

debug_name	Variable/*
dtype0*
shape:	�*
shared_name
Variable
a
)Variable/IsInitialized/VarIsInitializedOpVarIsInitializedOpVariable*
_output_shapes
: 
_
Variable/AssignAssignVariableOpVariable#Variable/Initializer/ReadVariableOp*
dtype0
f
Variable/Read/ReadVariableOpReadVariableOpVariable*
_output_shapes
:	�*
dtype0
�
gru_1/gru_cell/recurrent_kernelVarHandleOp*
_output_shapes
: *0

debug_name" gru_1/gru_cell/recurrent_kernel/*
dtype0*
shape:
��*0
shared_name!gru_1/gru_cell/recurrent_kernel
�
3gru_1/gru_cell/recurrent_kernel/Read/ReadVariableOpReadVariableOpgru_1/gru_cell/recurrent_kernel* 
_output_shapes
:
��*
dtype0
�
%Variable_1/Initializer/ReadVariableOpReadVariableOpgru_1/gru_cell/recurrent_kernel*
_class
loc:@Variable_1* 
_output_shapes
:
��*
dtype0
�

Variable_1VarHandleOp*
_class
loc:@Variable_1*
_output_shapes
: *

debug_nameVariable_1/*
dtype0*
shape:
��*
shared_name
Variable_1
e
+Variable_1/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_1*
_output_shapes
: 
e
Variable_1/AssignAssignVariableOp
Variable_1%Variable_1/Initializer/ReadVariableOp*
dtype0
k
Variable_1/Read/ReadVariableOpReadVariableOp
Variable_1* 
_output_shapes
:
��*
dtype0
�
gru_1/gru_cell/kernelVarHandleOp*
_output_shapes
: *&

debug_namegru_1/gru_cell/kernel/*
dtype0*
shape:	�*&
shared_namegru_1/gru_cell/kernel
�
)gru_1/gru_cell/kernel/Read/ReadVariableOpReadVariableOpgru_1/gru_cell/kernel*
_output_shapes
:	�*
dtype0
�
%Variable_2/Initializer/ReadVariableOpReadVariableOpgru_1/gru_cell/kernel*
_class
loc:@Variable_2*
_output_shapes
:	�*
dtype0
�

Variable_2VarHandleOp*
_class
loc:@Variable_2*
_output_shapes
: *

debug_nameVariable_2/*
dtype0*
shape:	�*
shared_name
Variable_2
e
+Variable_2/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_2*
_output_shapes
: 
e
Variable_2/AssignAssignVariableOp
Variable_2%Variable_2/Initializer/ReadVariableOp*
dtype0
j
Variable_2/Read/ReadVariableOpReadVariableOp
Variable_2*
_output_shapes
:	�*
dtype0
�
dense_1/biasVarHandleOp*
_output_shapes
: *

debug_namedense_1/bias/*
dtype0*
shape:
*
shared_namedense_1/bias
i
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes
:
*
dtype0
�
%Variable_3/Initializer/ReadVariableOpReadVariableOpdense_1/bias*
_class
loc:@Variable_3*
_output_shapes
:
*
dtype0
�

Variable_3VarHandleOp*
_class
loc:@Variable_3*
_output_shapes
: *

debug_nameVariable_3/*
dtype0*
shape:
*
shared_name
Variable_3
e
+Variable_3/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_3*
_output_shapes
: 
e
Variable_3/AssignAssignVariableOp
Variable_3%Variable_3/Initializer/ReadVariableOp*
dtype0
e
Variable_3/Read/ReadVariableOpReadVariableOp
Variable_3*
_output_shapes
:
*
dtype0
�
dense_1/kernelVarHandleOp*
_output_shapes
: *

debug_namedense_1/kernel/*
dtype0*
shape:	�
*
shared_namedense_1/kernel
r
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*
_output_shapes
:	�
*
dtype0
�
%Variable_4/Initializer/ReadVariableOpReadVariableOpdense_1/kernel*
_class
loc:@Variable_4*
_output_shapes
:	�
*
dtype0
�

Variable_4VarHandleOp*
_class
loc:@Variable_4*
_output_shapes
: *

debug_nameVariable_4/*
dtype0*
shape:	�
*
shared_name
Variable_4
e
+Variable_4/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_4*
_output_shapes
: 
e
Variable_4/AssignAssignVariableOp
Variable_4%Variable_4/Initializer/ReadVariableOp*
dtype0
j
Variable_4/Read/ReadVariableOpReadVariableOp
Variable_4*
_output_shapes
:	�
*
dtype0
�
adam/learning_rateVarHandleOp*
_output_shapes
: *#

debug_nameadam/learning_rate/*
dtype0*
shape: *#
shared_nameadam/learning_rate
q
&adam/learning_rate/Read/ReadVariableOpReadVariableOpadam/learning_rate*
_output_shapes
: *
dtype0
�
%Variable_5/Initializer/ReadVariableOpReadVariableOpadam/learning_rate*
_class
loc:@Variable_5*
_output_shapes
: *
dtype0
�

Variable_5VarHandleOp*
_class
loc:@Variable_5*
_output_shapes
: *

debug_nameVariable_5/*
dtype0*
shape: *
shared_name
Variable_5
e
+Variable_5/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_5*
_output_shapes
: 
e
Variable_5/AssignAssignVariableOp
Variable_5%Variable_5/Initializer/ReadVariableOp*
dtype0
a
Variable_5/Read/ReadVariableOpReadVariableOp
Variable_5*
_output_shapes
: *
dtype0
�
adam/iterationVarHandleOp*
_output_shapes
: *

debug_nameadam/iteration/*
dtype0	*
shape: *
shared_nameadam/iteration
i
"adam/iteration/Read/ReadVariableOpReadVariableOpadam/iteration*
_output_shapes
: *
dtype0	
�
%Variable_6/Initializer/ReadVariableOpReadVariableOpadam/iteration*
_class
loc:@Variable_6*
_output_shapes
: *
dtype0	
�

Variable_6VarHandleOp*
_class
loc:@Variable_6*
_output_shapes
: *

debug_nameVariable_6/*
dtype0	*
shape: *
shared_name
Variable_6
e
+Variable_6/IsInitialized/VarIsInitializedOpVarIsInitializedOp
Variable_6*
_output_shapes
: 
e
Variable_6/AssignAssignVariableOp
Variable_6%Variable_6/Initializer/ReadVariableOp*
dtype0	
a
Variable_6/Read/ReadVariableOpReadVariableOp
Variable_6*
_output_shapes
: *
dtype0	
�
serving_default_inputsPlaceholder*+
_output_shapes
:���������*
dtype0* 
shape:���������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_inputsgru_1/gru_cell/biasgru_1/gru_cell/kernelgru_1/gru_cell/recurrent_kerneldense_1/kerneldense_1/bias*
Tin

2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������*'
_read_only_resource_inputs	
*2
config_proto" 

CPU

GPU 2J 8� �J *:
f5R3
1__inference_signature_wrapper_serving_default_325

NoOpNoOp
�
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�
value�B� B�
�
_tracked
_inbound_nodes
_outbound_nodes
_losses
_losses_override
_operations
_layers
_build_shapes_dict
	output_names

	optimizer
_default_save_signature

signatures*
* 
* 
* 
* 
* 
'
0
1
2
3
4*
'
0
1
2
3
4*
* 
* 
�

_variables
_trainable_variables
 _trainable_variables_indices
_iterations
_learning_rate

_momentums
_velocities*

trace_0* 

serving_default* 
]
_inbound_nodes
_outbound_nodes
_losses
	_loss_ids
_losses_override* 
�
 cell
!_inbound_nodes
"_outbound_nodes
#_losses
$	_loss_ids
%_losses_override
&
state_size
'_build_shapes_dict*
]
(_inbound_nodes
)_outbound_nodes
*_losses
+	_loss_ids
,_losses_override* 
�
-_kernel
.bias
/_inbound_nodes
0_outbound_nodes
1_losses
2	_loss_ids
3_losses_override
4_build_shapes_dict*
u
5_inbound_nodes
6_outbound_nodes
7_losses
8	_loss_ids
9_losses_override
:_build_shapes_dict* 

0
1*
* 
* 
TN
VARIABLE_VALUE
Variable_60optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
WQ
VARIABLE_VALUE
Variable_53optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
�

;kernel
<recurrent_kernel
=bias
>_inbound_nodes
?_outbound_nodes
@_losses
A	_loss_ids
B_losses_override
C_build_shapes_dict*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
TN
VARIABLE_VALUE
Variable_40_operations/3/_kernel/.ATTRIBUTES/VARIABLE_VALUE*
QK
VARIABLE_VALUE
Variable_3-_operations/3/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
XR
VARIABLE_VALUE
Variable_24_operations/1/cell/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUE
Variable_1>_operations/1/cell/recurrent_kernel/.ATTRIBUTES/VARIABLE_VALUE*
TN
VARIABLE_VALUEVariable2_operations/1/cell/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename
Variable_6
Variable_5
Variable_4
Variable_3
Variable_2
Variable_1VariableConst*
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU 2J 8� �J *%
f R
__inference__traced_save_417
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filename
Variable_6
Variable_5
Variable_4
Variable_3
Variable_2
Variable_1Variable*
Tin

2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *2
config_proto" 

CPU

GPU 2J 8� �J *(
f#R!
__inference__traced_restore_447��
�?
�
__inference__traced_save_417
file_prefix+
!read_disablecopyonread_variable_6:	 -
#read_1_disablecopyonread_variable_5: 6
#read_2_disablecopyonread_variable_4:	�
1
#read_3_disablecopyonread_variable_3:
6
#read_4_disablecopyonread_variable_2:	�7
#read_5_disablecopyonread_variable_1:
��4
!read_6_disablecopyonread_variable:	�
savev2_const
identity_15��MergeV2Checkpoints�Read/DisableCopyOnRead�Read/ReadVariableOp�Read_1/DisableCopyOnRead�Read_1/ReadVariableOp�Read_2/DisableCopyOnRead�Read_2/ReadVariableOp�Read_3/DisableCopyOnRead�Read_3/ReadVariableOp�Read_4/DisableCopyOnRead�Read_4/ReadVariableOp�Read_5/DisableCopyOnRead�Read_5/ReadVariableOp�Read_6/DisableCopyOnRead�Read_6/ReadVariableOpw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: d
Read/DisableCopyOnReadDisableCopyOnRead!read_disablecopyonread_variable_6*
_output_shapes
 �
Read/ReadVariableOpReadVariableOp!read_disablecopyonread_variable_6^Read/DisableCopyOnRead*
_output_shapes
: *
dtype0	R
IdentityIdentityRead/ReadVariableOp:value:0*
T0	*
_output_shapes
: Y

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0	*
_output_shapes
: h
Read_1/DisableCopyOnReadDisableCopyOnRead#read_1_disablecopyonread_variable_5*
_output_shapes
 �
Read_1/ReadVariableOpReadVariableOp#read_1_disablecopyonread_variable_5^Read_1/DisableCopyOnRead*
_output_shapes
: *
dtype0V

Identity_2IdentityRead_1/ReadVariableOp:value:0*
T0*
_output_shapes
: [

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes
: h
Read_2/DisableCopyOnReadDisableCopyOnRead#read_2_disablecopyonread_variable_4*
_output_shapes
 �
Read_2/ReadVariableOpReadVariableOp#read_2_disablecopyonread_variable_4^Read_2/DisableCopyOnRead*
_output_shapes
:	�
*
dtype0_

Identity_4IdentityRead_2/ReadVariableOp:value:0*
T0*
_output_shapes
:	�
d

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*
_output_shapes
:	�
h
Read_3/DisableCopyOnReadDisableCopyOnRead#read_3_disablecopyonread_variable_3*
_output_shapes
 �
Read_3/ReadVariableOpReadVariableOp#read_3_disablecopyonread_variable_3^Read_3/DisableCopyOnRead*
_output_shapes
:
*
dtype0Z

Identity_6IdentityRead_3/ReadVariableOp:value:0*
T0*
_output_shapes
:
_

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0*
_output_shapes
:
h
Read_4/DisableCopyOnReadDisableCopyOnRead#read_4_disablecopyonread_variable_2*
_output_shapes
 �
Read_4/ReadVariableOpReadVariableOp#read_4_disablecopyonread_variable_2^Read_4/DisableCopyOnRead*
_output_shapes
:	�*
dtype0_

Identity_8IdentityRead_4/ReadVariableOp:value:0*
T0*
_output_shapes
:	�d

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0*
_output_shapes
:	�h
Read_5/DisableCopyOnReadDisableCopyOnRead#read_5_disablecopyonread_variable_1*
_output_shapes
 �
Read_5/ReadVariableOpReadVariableOp#read_5_disablecopyonread_variable_1^Read_5/DisableCopyOnRead* 
_output_shapes
:
��*
dtype0a
Identity_10IdentityRead_5/ReadVariableOp:value:0*
T0* 
_output_shapes
:
��g
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0* 
_output_shapes
:
��f
Read_6/DisableCopyOnReadDisableCopyOnRead!read_6_disablecopyonread_variable*
_output_shapes
 �
Read_6/ReadVariableOpReadVariableOp!read_6_disablecopyonread_variable^Read_6/DisableCopyOnRead*
_output_shapes
:	�*
dtype0`
Identity_12IdentityRead_6/ReadVariableOp:value:0*
T0*
_output_shapes
:	�f
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*
_output_shapes
:	�L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB0_operations/3/_kernel/.ATTRIBUTES/VARIABLE_VALUEB-_operations/3/bias/.ATTRIBUTES/VARIABLE_VALUEB4_operations/1/cell/kernel/.ATTRIBUTES/VARIABLE_VALUEB>_operations/1/cell/recurrent_kernel/.ATTRIBUTES/VARIABLE_VALUEB2_operations/1/cell/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH}
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*#
valueBB B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtypes

2	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 i
Identity_14Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: U
Identity_15IdentityIdentity_14:output:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp*
_output_shapes
 "#
identity_15Identity_15:output:0*(
_construction_contextkEagerRuntime*%
_input_shapes
: : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints20
Read/DisableCopyOnReadRead/DisableCopyOnRead2*
Read/ReadVariableOpRead/ReadVariableOp24
Read_1/DisableCopyOnReadRead_1/DisableCopyOnRead2.
Read_1/ReadVariableOpRead_1/ReadVariableOp24
Read_2/DisableCopyOnReadRead_2/DisableCopyOnRead2.
Read_2/ReadVariableOpRead_2/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:*&
$
_user_specified_name
Variable_6:*&
$
_user_specified_name
Variable_5:*&
$
_user_specified_name
Variable_4:*&
$
_user_specified_name
Variable_3:*&
$
_user_specified_name
Variable_2:*&
$
_user_specified_name
Variable_1:($
"
_user_specified_name
Variable:=9

_output_shapes
: 

_user_specified_nameConst
�
�
%functional_1_1_gru_1_1_while_cond_195J
Ffunctional_1_1_gru_1_1_while_functional_1_1_gru_1_1_while_loop_counter;
7functional_1_1_gru_1_1_while_functional_1_1_gru_1_1_max,
(functional_1_1_gru_1_1_while_placeholder.
*functional_1_1_gru_1_1_while_placeholder_1.
*functional_1_1_gru_1_1_while_placeholder_2_
[functional_1_1_gru_1_1_while_functional_1_1_gru_1_1_while_cond_195___redundant_placeholder0_
[functional_1_1_gru_1_1_while_functional_1_1_gru_1_1_while_cond_195___redundant_placeholder1_
[functional_1_1_gru_1_1_while_functional_1_1_gru_1_1_while_cond_195___redundant_placeholder2_
[functional_1_1_gru_1_1_while_functional_1_1_gru_1_1_while_cond_195___redundant_placeholder3)
%functional_1_1_gru_1_1_while_identity
e
#functional_1_1/gru_1_1/while/Less/yConst*
_output_shapes
: *
dtype0*
value	B :�
!functional_1_1/gru_1_1/while/LessLess(functional_1_1_gru_1_1_while_placeholder,functional_1_1/gru_1_1/while/Less/y:output:0*
T0*
_output_shapes
: �
#functional_1_1/gru_1_1/while/Less_1LessFfunctional_1_1_gru_1_1_while_functional_1_1_gru_1_1_while_loop_counter7functional_1_1_gru_1_1_while_functional_1_1_gru_1_1_max*
T0*
_output_shapes
: �
'functional_1_1/gru_1_1/while/LogicalAnd
LogicalAnd'functional_1_1/gru_1_1/while/Less_1:z:0%functional_1_1/gru_1_1/while/Less:z:0*
_output_shapes
: 
%functional_1_1/gru_1_1/while/IdentityIdentity+functional_1_1/gru_1_1/while/LogicalAnd:z:0*
T0
*
_output_shapes
: "W
%functional_1_1_gru_1_1_while_identity.functional_1_1/gru_1_1/while/Identity:output:0*(
_construction_contextkEagerRuntime*?
_input_shapes.
,: : : : :����������:::::a ]

_output_shapes
: 
C
_user_specified_name+)functional_1_1/gru_1_1/while/loop_counter:RN

_output_shapes
: 
4
_user_specified_namefunctional_1_1/gru_1_1/Max:

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:����������:

_output_shapes
:
�n
�
%functional_1_1_gru_1_1_while_body_196J
Ffunctional_1_1_gru_1_1_while_functional_1_1_gru_1_1_while_loop_counter;
7functional_1_1_gru_1_1_while_functional_1_1_gru_1_1_max,
(functional_1_1_gru_1_1_while_placeholder.
*functional_1_1_gru_1_1_while_placeholder_1.
*functional_1_1_gru_1_1_while_placeholder_2�
�functional_1_1_gru_1_1_while_tensorarrayv2read_tensorlistgetitem_functional_1_1_gru_1_1_tensorarrayunstack_tensorlistfromtensor_0Z
Gfunctional_1_1_gru_1_1_while_gru_cell_1_split_readvariableop_resource_0:	�Y
Ffunctional_1_1_gru_1_1_while_gru_cell_1_cast_readvariableop_resource_0:	�\
Hfunctional_1_1_gru_1_1_while_gru_cell_1_cast_1_readvariableop_resource_0:
��)
%functional_1_1_gru_1_1_while_identity+
'functional_1_1_gru_1_1_while_identity_1+
'functional_1_1_gru_1_1_while_identity_2+
'functional_1_1_gru_1_1_while_identity_3+
'functional_1_1_gru_1_1_while_identity_4�
functional_1_1_gru_1_1_while_tensorarrayv2read_tensorlistgetitem_functional_1_1_gru_1_1_tensorarrayunstack_tensorlistfromtensorX
Efunctional_1_1_gru_1_1_while_gru_cell_1_split_readvariableop_resource:	�W
Dfunctional_1_1_gru_1_1_while_gru_cell_1_cast_readvariableop_resource:	�Z
Ffunctional_1_1_gru_1_1_while_gru_cell_1_cast_1_readvariableop_resource:
����;functional_1_1/gru_1_1/while/gru_cell_1/Cast/ReadVariableOp�=functional_1_1/gru_1_1/while/gru_cell_1/Cast_1/ReadVariableOp�<functional_1_1/gru_1_1/while/gru_cell_1/split/ReadVariableOp�
Nfunctional_1_1/gru_1_1/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
@functional_1_1/gru_1_1/while/TensorArrayV2Read/TensorListGetItemTensorListGetItem�functional_1_1_gru_1_1_while_tensorarrayv2read_tensorlistgetitem_functional_1_1_gru_1_1_tensorarrayunstack_tensorlistfromtensor_0(functional_1_1_gru_1_1_while_placeholderWfunctional_1_1/gru_1_1/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0y
7functional_1_1/gru_1_1/while/gru_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B : �
<functional_1_1/gru_1_1/while/gru_cell_1/split/ReadVariableOpReadVariableOpGfunctional_1_1_gru_1_1_while_gru_cell_1_split_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
-functional_1_1/gru_1_1/while/gru_cell_1/splitSplit@functional_1_1/gru_1_1/while/gru_cell_1/split/split_dim:output:0Dfunctional_1_1/gru_1_1/while/gru_cell_1/split/ReadVariableOp:value:0*
T0**
_output_shapes
:	�:	�*
	num_split�
/functional_1_1/gru_1_1/while/gru_cell_1/SqueezeSqueeze6functional_1_1/gru_1_1/while/gru_cell_1/split:output:0*
T0*
_output_shapes	
:�*
squeeze_dims
 �
1functional_1_1/gru_1_1/while/gru_cell_1/Squeeze_1Squeeze6functional_1_1/gru_1_1/while/gru_cell_1/split:output:1*
T0*
_output_shapes	
:�*
squeeze_dims
 �
;functional_1_1/gru_1_1/while/gru_cell_1/Cast/ReadVariableOpReadVariableOpFfunctional_1_1_gru_1_1_while_gru_cell_1_cast_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
.functional_1_1/gru_1_1/while/gru_cell_1/MatMulMatMulGfunctional_1_1/gru_1_1/while/TensorArrayV2Read/TensorListGetItem:item:0Cfunctional_1_1/gru_1_1/while/gru_cell_1/Cast/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
+functional_1_1/gru_1_1/while/gru_cell_1/addAddV28functional_1_1/gru_1_1/while/gru_cell_1/MatMul:product:08functional_1_1/gru_1_1/while/gru_cell_1/Squeeze:output:0*
T0*(
_output_shapes
:�����������
9functional_1_1/gru_1_1/while/gru_cell_1/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
/functional_1_1/gru_1_1/while/gru_cell_1/split_1SplitBfunctional_1_1/gru_1_1/while/gru_cell_1/split_1/split_dim:output:0/functional_1_1/gru_1_1/while/gru_cell_1/add:z:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
=functional_1_1/gru_1_1/while/gru_cell_1/Cast_1/ReadVariableOpReadVariableOpHfunctional_1_1_gru_1_1_while_gru_cell_1_cast_1_readvariableop_resource_0* 
_output_shapes
:
��*
dtype0�
0functional_1_1/gru_1_1/while/gru_cell_1/MatMul_1MatMul*functional_1_1_gru_1_1_while_placeholder_2Efunctional_1_1/gru_1_1/while/gru_cell_1/Cast_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
-functional_1_1/gru_1_1/while/gru_cell_1/add_1AddV2:functional_1_1/gru_1_1/while/gru_cell_1/MatMul_1:product:0:functional_1_1/gru_1_1/while/gru_cell_1/Squeeze_1:output:0*
T0*(
_output_shapes
:�����������
;functional_1_1/gru_1_1/while/gru_cell_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        �
=functional_1_1/gru_1_1/while/gru_cell_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"    �   �
=functional_1_1/gru_1_1/while/gru_cell_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      �
5functional_1_1/gru_1_1/while/gru_cell_1/strided_sliceStridedSlice1functional_1_1/gru_1_1/while/gru_cell_1/add_1:z:0Dfunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice/stack:output:0Ffunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice/stack_1:output:0Ffunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*

begin_mask*
end_mask�
=functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"    �   �
?functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"    �  �
?functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      �
7functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_1StridedSlice1functional_1_1/gru_1_1/while/gru_cell_1/add_1:z:0Ffunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice_1/stack:output:0Hfunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice_1/stack_1:output:0Hfunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice_1/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*

begin_mask*
end_mask�
=functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"    �  �
?functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        �
?functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      �
7functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_2StridedSlice1functional_1_1/gru_1_1/while/gru_cell_1/add_1:z:0Ffunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice_2/stack:output:0Hfunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice_2/stack_1:output:0Hfunctional_1_1/gru_1_1/while/gru_cell_1/strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*

begin_mask*
end_mask�
-functional_1_1/gru_1_1/while/gru_cell_1/add_2AddV28functional_1_1/gru_1_1/while/gru_cell_1/split_1:output:0>functional_1_1/gru_1_1/while/gru_cell_1/strided_slice:output:0*
T0*(
_output_shapes
:�����������
/functional_1_1/gru_1_1/while/gru_cell_1/SigmoidSigmoid1functional_1_1/gru_1_1/while/gru_cell_1/add_2:z:0*
T0*(
_output_shapes
:�����������
-functional_1_1/gru_1_1/while/gru_cell_1/add_3AddV28functional_1_1/gru_1_1/while/gru_cell_1/split_1:output:1@functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_1:output:0*
T0*(
_output_shapes
:�����������
1functional_1_1/gru_1_1/while/gru_cell_1/Sigmoid_1Sigmoid1functional_1_1/gru_1_1/while/gru_cell_1/add_3:z:0*
T0*(
_output_shapes
:�����������
+functional_1_1/gru_1_1/while/gru_cell_1/mulMul5functional_1_1/gru_1_1/while/gru_cell_1/Sigmoid_1:y:0@functional_1_1/gru_1_1/while/gru_cell_1/strided_slice_2:output:0*
T0*(
_output_shapes
:�����������
-functional_1_1/gru_1_1/while/gru_cell_1/add_4AddV28functional_1_1/gru_1_1/while/gru_cell_1/split_1:output:2/functional_1_1/gru_1_1/while/gru_cell_1/mul:z:0*
T0*(
_output_shapes
:�����������
,functional_1_1/gru_1_1/while/gru_cell_1/ReluRelu1functional_1_1/gru_1_1/while/gru_cell_1/add_4:z:0*
T0*(
_output_shapes
:�����������
-functional_1_1/gru_1_1/while/gru_cell_1/mul_1Mul3functional_1_1/gru_1_1/while/gru_cell_1/Sigmoid:y:0*functional_1_1_gru_1_1_while_placeholder_2*
T0*(
_output_shapes
:����������r
-functional_1_1/gru_1_1/while/gru_cell_1/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
+functional_1_1/gru_1_1/while/gru_cell_1/subSub6functional_1_1/gru_1_1/while/gru_cell_1/sub/x:output:03functional_1_1/gru_1_1/while/gru_cell_1/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
-functional_1_1/gru_1_1/while/gru_cell_1/mul_2Mul/functional_1_1/gru_1_1/while/gru_cell_1/sub:z:0:functional_1_1/gru_1_1/while/gru_cell_1/Relu:activations:0*
T0*(
_output_shapes
:�����������
-functional_1_1/gru_1_1/while/gru_cell_1/add_5AddV21functional_1_1/gru_1_1/while/gru_cell_1/mul_1:z:01functional_1_1/gru_1_1/while/gru_cell_1/mul_2:z:0*
T0*(
_output_shapes
:�����������
Gfunctional_1_1/gru_1_1/while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
Afunctional_1_1/gru_1_1/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem*functional_1_1_gru_1_1_while_placeholder_1Pfunctional_1_1/gru_1_1/while/TensorArrayV2Write/TensorListSetItem/index:output:01functional_1_1/gru_1_1/while/gru_cell_1/add_5:z:0*
_output_shapes
: *
element_dtype0:���d
"functional_1_1/gru_1_1/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :�
 functional_1_1/gru_1_1/while/addAddV2(functional_1_1_gru_1_1_while_placeholder+functional_1_1/gru_1_1/while/add/y:output:0*
T0*
_output_shapes
: f
$functional_1_1/gru_1_1/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
"functional_1_1/gru_1_1/while/add_1AddV2Ffunctional_1_1_gru_1_1_while_functional_1_1_gru_1_1_while_loop_counter-functional_1_1/gru_1_1/while/add_1/y:output:0*
T0*
_output_shapes
: �
%functional_1_1/gru_1_1/while/IdentityIdentity&functional_1_1/gru_1_1/while/add_1:z:0"^functional_1_1/gru_1_1/while/NoOp*
T0*
_output_shapes
: �
'functional_1_1/gru_1_1/while/Identity_1Identity7functional_1_1_gru_1_1_while_functional_1_1_gru_1_1_max"^functional_1_1/gru_1_1/while/NoOp*
T0*
_output_shapes
: �
'functional_1_1/gru_1_1/while/Identity_2Identity$functional_1_1/gru_1_1/while/add:z:0"^functional_1_1/gru_1_1/while/NoOp*
T0*
_output_shapes
: �
'functional_1_1/gru_1_1/while/Identity_3IdentityQfunctional_1_1/gru_1_1/while/TensorArrayV2Write/TensorListSetItem:output_handle:0"^functional_1_1/gru_1_1/while/NoOp*
T0*
_output_shapes
: �
'functional_1_1/gru_1_1/while/Identity_4Identity1functional_1_1/gru_1_1/while/gru_cell_1/add_5:z:0"^functional_1_1/gru_1_1/while/NoOp*
T0*(
_output_shapes
:�����������
!functional_1_1/gru_1_1/while/NoOpNoOp<^functional_1_1/gru_1_1/while/gru_cell_1/Cast/ReadVariableOp>^functional_1_1/gru_1_1/while/gru_cell_1/Cast_1/ReadVariableOp=^functional_1_1/gru_1_1/while/gru_cell_1/split/ReadVariableOp*
_output_shapes
 "�
Ffunctional_1_1_gru_1_1_while_gru_cell_1_cast_1_readvariableop_resourceHfunctional_1_1_gru_1_1_while_gru_cell_1_cast_1_readvariableop_resource_0"�
Dfunctional_1_1_gru_1_1_while_gru_cell_1_cast_readvariableop_resourceFfunctional_1_1_gru_1_1_while_gru_cell_1_cast_readvariableop_resource_0"�
Efunctional_1_1_gru_1_1_while_gru_cell_1_split_readvariableop_resourceGfunctional_1_1_gru_1_1_while_gru_cell_1_split_readvariableop_resource_0"W
%functional_1_1_gru_1_1_while_identity.functional_1_1/gru_1_1/while/Identity:output:0"[
'functional_1_1_gru_1_1_while_identity_10functional_1_1/gru_1_1/while/Identity_1:output:0"[
'functional_1_1_gru_1_1_while_identity_20functional_1_1/gru_1_1/while/Identity_2:output:0"[
'functional_1_1_gru_1_1_while_identity_30functional_1_1/gru_1_1/while/Identity_3:output:0"[
'functional_1_1_gru_1_1_while_identity_40functional_1_1/gru_1_1/while/Identity_4:output:0"�
functional_1_1_gru_1_1_while_tensorarrayv2read_tensorlistgetitem_functional_1_1_gru_1_1_tensorarrayunstack_tensorlistfromtensor�functional_1_1_gru_1_1_while_tensorarrayv2read_tensorlistgetitem_functional_1_1_gru_1_1_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$: : : : :����������: : : : 2z
;functional_1_1/gru_1_1/while/gru_cell_1/Cast/ReadVariableOp;functional_1_1/gru_1_1/while/gru_cell_1/Cast/ReadVariableOp2~
=functional_1_1/gru_1_1/while/gru_cell_1/Cast_1/ReadVariableOp=functional_1_1/gru_1_1/while/gru_cell_1/Cast_1/ReadVariableOp2|
<functional_1_1/gru_1_1/while/gru_cell_1/split/ReadVariableOp<functional_1_1/gru_1_1/while/gru_cell_1/split/ReadVariableOp:a ]

_output_shapes
: 
C
_user_specified_name+)functional_1_1/gru_1_1/while/loop_counter:RN

_output_shapes
: 
4
_user_specified_namefunctional_1_1/gru_1_1/Max:

_output_shapes
: :

_output_shapes
: :.*
(
_output_shapes
:����������:vr

_output_shapes
: 
X
_user_specified_name@>functional_1_1/gru_1_1/TensorArrayUnstack/TensorListFromTensor:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource
�	
�
1__inference_signature_wrapper_serving_default_325

inputs
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�

	unknown_3:

identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:���������*'
_read_only_resource_inputs	
*2
config_proto" 

CPU

GPU 2J 8� �J *(
f#R!
__inference_serving_default_309s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:���������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs:#

_user_specified_name313:#

_user_specified_name315:#

_user_specified_name317:#

_user_specified_name319:#

_user_specified_name321
�$
�
__inference__traced_restore_447
file_prefix%
assignvariableop_variable_6:	 '
assignvariableop_1_variable_5: 0
assignvariableop_2_variable_4:	�
+
assignvariableop_3_variable_3:
0
assignvariableop_4_variable_2:	�1
assignvariableop_5_variable_1:
��.
assignvariableop_6_variable:	�

identity_8��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_2�AssignVariableOp_3�AssignVariableOp_4�AssignVariableOp_5�AssignVariableOp_6�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB0_operations/3/_kernel/.ATTRIBUTES/VARIABLE_VALUEB-_operations/3/bias/.ATTRIBUTES/VARIABLE_VALUEB4_operations/1/cell/kernel/.ATTRIBUTES/VARIABLE_VALUEB>_operations/1/cell/recurrent_kernel/.ATTRIBUTES/VARIABLE_VALUEB2_operations/1/cell/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*#
valueBB B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*4
_output_shapes"
 ::::::::*
dtypes

2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOpAssignVariableOpassignvariableop_variable_6Identity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOpassignvariableop_1_variable_5Identity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOpassignvariableop_2_variable_4Identity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOpassignvariableop_3_variable_3Identity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOpassignvariableop_4_variable_2Identity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOpassignvariableop_5_variable_1Identity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOpassignvariableop_6_variableIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 �

Identity_7Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^NoOp"/device:CPU:0*
T0*
_output_shapes
: U

Identity_8IdentityIdentity_7:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6*
_output_shapes
 "!

identity_8Identity_8:output:0*(
_construction_contextkEagerRuntime*#
_input_shapes
: : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_6:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:*&
$
_user_specified_name
Variable_6:*&
$
_user_specified_name
Variable_5:*&
$
_user_specified_name
Variable_4:*&
$
_user_specified_name
Variable_3:*&
$
_user_specified_name
Variable_2:*&
$
_user_specified_name
Variable_1:($
"
_user_specified_name
Variable
�
�
__inference_serving_default_309

inputsR
?functional_1_1_gru_1_1_gru_cell_1_split_readvariableop_resource:	�Q
>functional_1_1_gru_1_1_gru_cell_1_cast_readvariableop_resource:	�T
@functional_1_1_gru_1_1_gru_cell_1_cast_1_readvariableop_resource:
��H
5functional_1_1_dense_1_1_cast_readvariableop_resource:	�
F
8functional_1_1_dense_1_1_biasadd_readvariableop_resource:

identity��/functional_1_1/dense_1_1/BiasAdd/ReadVariableOp�,functional_1_1/dense_1_1/Cast/ReadVariableOp�5functional_1_1/gru_1_1/gru_cell_1/Cast/ReadVariableOp�7functional_1_1/gru_1_1/gru_cell_1/Cast_1/ReadVariableOp�6functional_1_1/gru_1_1/gru_cell_1/split/ReadVariableOp�functional_1_1/gru_1_1/while`
functional_1_1/gru_1_1/ShapeShapeinputs*
T0*
_output_shapes
::��t
*functional_1_1/gru_1_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: v
,functional_1_1/gru_1_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:v
,functional_1_1/gru_1_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
$functional_1_1/gru_1_1/strided_sliceStridedSlice%functional_1_1/gru_1_1/Shape:output:03functional_1_1/gru_1_1/strided_slice/stack:output:05functional_1_1/gru_1_1/strided_slice/stack_1:output:05functional_1_1/gru_1_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskh
%functional_1_1/gru_1_1/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :��
#functional_1_1/gru_1_1/zeros/packedPack-functional_1_1/gru_1_1/strided_slice:output:0.functional_1_1/gru_1_1/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:g
"functional_1_1/gru_1_1/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    �
functional_1_1/gru_1_1/zerosFill,functional_1_1/gru_1_1/zeros/packed:output:0+functional_1_1/gru_1_1/zeros/Const:output:0*
T0*(
_output_shapes
:�����������
,functional_1_1/gru_1_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*!
valueB"            �
.functional_1_1/gru_1_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*!
valueB"           �
.functional_1_1/gru_1_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*!
valueB"         �
&functional_1_1/gru_1_1/strided_slice_1StridedSliceinputs5functional_1_1/gru_1_1/strided_slice_1/stack:output:07functional_1_1/gru_1_1/strided_slice_1/stack_1:output:07functional_1_1/gru_1_1/strided_slice_1/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*

begin_mask*
end_mask*
shrink_axis_maskz
%functional_1_1/gru_1_1/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
 functional_1_1/gru_1_1/transpose	Transposeinputs.functional_1_1/gru_1_1/transpose/perm:output:0*
T0*+
_output_shapes
:���������}
2functional_1_1/gru_1_1/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
���������s
1functional_1_1/gru_1_1/TensorArrayV2/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
$functional_1_1/gru_1_1/TensorArrayV2TensorListReserve;functional_1_1/gru_1_1/TensorArrayV2/element_shape:output:0:functional_1_1/gru_1_1/TensorArrayV2/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
Lfunctional_1_1/gru_1_1/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
>functional_1_1/gru_1_1/TensorArrayUnstack/TensorListFromTensorTensorListFromTensor$functional_1_1/gru_1_1/transpose:y:0Ufunctional_1_1/gru_1_1/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���v
,functional_1_1/gru_1_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: x
.functional_1_1/gru_1_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.functional_1_1/gru_1_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
&functional_1_1/gru_1_1/strided_slice_2StridedSlice$functional_1_1/gru_1_1/transpose:y:05functional_1_1/gru_1_1/strided_slice_2/stack:output:07functional_1_1/gru_1_1/strided_slice_2/stack_1:output:07functional_1_1/gru_1_1/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_masks
1functional_1_1/gru_1_1/gru_cell_1/split/split_dimConst*
_output_shapes
: *
dtype0*
value	B : �
6functional_1_1/gru_1_1/gru_cell_1/split/ReadVariableOpReadVariableOp?functional_1_1_gru_1_1_gru_cell_1_split_readvariableop_resource*
_output_shapes
:	�*
dtype0�
'functional_1_1/gru_1_1/gru_cell_1/splitSplit:functional_1_1/gru_1_1/gru_cell_1/split/split_dim:output:0>functional_1_1/gru_1_1/gru_cell_1/split/ReadVariableOp:value:0*
T0**
_output_shapes
:	�:	�*
	num_split�
)functional_1_1/gru_1_1/gru_cell_1/SqueezeSqueeze0functional_1_1/gru_1_1/gru_cell_1/split:output:0*
T0*
_output_shapes	
:�*
squeeze_dims
 �
+functional_1_1/gru_1_1/gru_cell_1/Squeeze_1Squeeze0functional_1_1/gru_1_1/gru_cell_1/split:output:1*
T0*
_output_shapes	
:�*
squeeze_dims
 �
5functional_1_1/gru_1_1/gru_cell_1/Cast/ReadVariableOpReadVariableOp>functional_1_1_gru_1_1_gru_cell_1_cast_readvariableop_resource*
_output_shapes
:	�*
dtype0�
(functional_1_1/gru_1_1/gru_cell_1/MatMulMatMul/functional_1_1/gru_1_1/strided_slice_2:output:0=functional_1_1/gru_1_1/gru_cell_1/Cast/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
%functional_1_1/gru_1_1/gru_cell_1/addAddV22functional_1_1/gru_1_1/gru_cell_1/MatMul:product:02functional_1_1/gru_1_1/gru_cell_1/Squeeze:output:0*
T0*(
_output_shapes
:����������~
3functional_1_1/gru_1_1/gru_cell_1/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
)functional_1_1/gru_1_1/gru_cell_1/split_1Split<functional_1_1/gru_1_1/gru_cell_1/split_1/split_dim:output:0)functional_1_1/gru_1_1/gru_cell_1/add:z:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
7functional_1_1/gru_1_1/gru_cell_1/Cast_1/ReadVariableOpReadVariableOp@functional_1_1_gru_1_1_gru_cell_1_cast_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
*functional_1_1/gru_1_1/gru_cell_1/MatMul_1MatMul%functional_1_1/gru_1_1/zeros:output:0?functional_1_1/gru_1_1/gru_cell_1/Cast_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
'functional_1_1/gru_1_1/gru_cell_1/add_1AddV24functional_1_1/gru_1_1/gru_cell_1/MatMul_1:product:04functional_1_1/gru_1_1/gru_cell_1/Squeeze_1:output:0*
T0*(
_output_shapes
:�����������
5functional_1_1/gru_1_1/gru_cell_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB"        �
7functional_1_1/gru_1_1/gru_cell_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB"    �   �
7functional_1_1/gru_1_1/gru_cell_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      �
/functional_1_1/gru_1_1/gru_cell_1/strided_sliceStridedSlice+functional_1_1/gru_1_1/gru_cell_1/add_1:z:0>functional_1_1/gru_1_1/gru_cell_1/strided_slice/stack:output:0@functional_1_1/gru_1_1/gru_cell_1/strided_slice/stack_1:output:0@functional_1_1/gru_1_1/gru_cell_1/strided_slice/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*

begin_mask*
end_mask�
7functional_1_1/gru_1_1/gru_cell_1/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"    �   �
9functional_1_1/gru_1_1/gru_cell_1/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"    �  �
9functional_1_1/gru_1_1/gru_cell_1/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      �
1functional_1_1/gru_1_1/gru_cell_1/strided_slice_1StridedSlice+functional_1_1/gru_1_1/gru_cell_1/add_1:z:0@functional_1_1/gru_1_1/gru_cell_1/strided_slice_1/stack:output:0Bfunctional_1_1/gru_1_1/gru_cell_1/strided_slice_1/stack_1:output:0Bfunctional_1_1/gru_1_1/gru_cell_1/strided_slice_1/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*

begin_mask*
end_mask�
7functional_1_1/gru_1_1/gru_cell_1/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"    �  �
9functional_1_1/gru_1_1/gru_cell_1/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"        �
9functional_1_1/gru_1_1/gru_cell_1/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      �
1functional_1_1/gru_1_1/gru_cell_1/strided_slice_2StridedSlice+functional_1_1/gru_1_1/gru_cell_1/add_1:z:0@functional_1_1/gru_1_1/gru_cell_1/strided_slice_2/stack:output:0Bfunctional_1_1/gru_1_1/gru_cell_1/strided_slice_2/stack_1:output:0Bfunctional_1_1/gru_1_1/gru_cell_1/strided_slice_2/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*

begin_mask*
end_mask�
'functional_1_1/gru_1_1/gru_cell_1/add_2AddV22functional_1_1/gru_1_1/gru_cell_1/split_1:output:08functional_1_1/gru_1_1/gru_cell_1/strided_slice:output:0*
T0*(
_output_shapes
:�����������
)functional_1_1/gru_1_1/gru_cell_1/SigmoidSigmoid+functional_1_1/gru_1_1/gru_cell_1/add_2:z:0*
T0*(
_output_shapes
:�����������
'functional_1_1/gru_1_1/gru_cell_1/add_3AddV22functional_1_1/gru_1_1/gru_cell_1/split_1:output:1:functional_1_1/gru_1_1/gru_cell_1/strided_slice_1:output:0*
T0*(
_output_shapes
:�����������
+functional_1_1/gru_1_1/gru_cell_1/Sigmoid_1Sigmoid+functional_1_1/gru_1_1/gru_cell_1/add_3:z:0*
T0*(
_output_shapes
:�����������
%functional_1_1/gru_1_1/gru_cell_1/mulMul/functional_1_1/gru_1_1/gru_cell_1/Sigmoid_1:y:0:functional_1_1/gru_1_1/gru_cell_1/strided_slice_2:output:0*
T0*(
_output_shapes
:�����������
'functional_1_1/gru_1_1/gru_cell_1/add_4AddV22functional_1_1/gru_1_1/gru_cell_1/split_1:output:2)functional_1_1/gru_1_1/gru_cell_1/mul:z:0*
T0*(
_output_shapes
:�����������
&functional_1_1/gru_1_1/gru_cell_1/ReluRelu+functional_1_1/gru_1_1/gru_cell_1/add_4:z:0*
T0*(
_output_shapes
:�����������
'functional_1_1/gru_1_1/gru_cell_1/mul_1Mul-functional_1_1/gru_1_1/gru_cell_1/Sigmoid:y:0%functional_1_1/gru_1_1/zeros:output:0*
T0*(
_output_shapes
:����������l
'functional_1_1/gru_1_1/gru_cell_1/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
%functional_1_1/gru_1_1/gru_cell_1/subSub0functional_1_1/gru_1_1/gru_cell_1/sub/x:output:0-functional_1_1/gru_1_1/gru_cell_1/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
'functional_1_1/gru_1_1/gru_cell_1/mul_2Mul)functional_1_1/gru_1_1/gru_cell_1/sub:z:04functional_1_1/gru_1_1/gru_cell_1/Relu:activations:0*
T0*(
_output_shapes
:�����������
'functional_1_1/gru_1_1/gru_cell_1/add_5AddV2+functional_1_1/gru_1_1/gru_cell_1/mul_1:z:0+functional_1_1/gru_1_1/gru_cell_1/mul_2:z:0*
T0*(
_output_shapes
:�����������
4functional_1_1/gru_1_1/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   u
3functional_1_1/gru_1_1/TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
&functional_1_1/gru_1_1/TensorArrayV2_1TensorListReserve=functional_1_1/gru_1_1/TensorArrayV2_1/element_shape:output:0<functional_1_1/gru_1_1/TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���]
functional_1_1/gru_1_1/timeConst*
_output_shapes
: *
dtype0*
value	B : c
!functional_1_1/gru_1_1/Rank/ConstConst*
_output_shapes
: *
dtype0*
value	B :]
functional_1_1/gru_1_1/RankConst*
_output_shapes
: *
dtype0*
value	B : d
"functional_1_1/gru_1_1/range/startConst*
_output_shapes
: *
dtype0*
value	B : d
"functional_1_1/gru_1_1/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :�
functional_1_1/gru_1_1/rangeRange+functional_1_1/gru_1_1/range/start:output:0$functional_1_1/gru_1_1/Rank:output:0+functional_1_1/gru_1_1/range/delta:output:0*
_output_shapes
: b
 functional_1_1/gru_1_1/Max/inputConst*
_output_shapes
: *
dtype0*
value	B :�
functional_1_1/gru_1_1/MaxMax)functional_1_1/gru_1_1/Max/input:output:0%functional_1_1/gru_1_1/range:output:0*
T0*
_output_shapes
: k
)functional_1_1/gru_1_1/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
functional_1_1/gru_1_1/whileWhile2functional_1_1/gru_1_1/while/loop_counter:output:0#functional_1_1/gru_1_1/Max:output:0$functional_1_1/gru_1_1/time:output:0/functional_1_1/gru_1_1/TensorArrayV2_1:handle:0%functional_1_1/gru_1_1/zeros:output:0Nfunctional_1_1/gru_1_1/TensorArrayUnstack/TensorListFromTensor:output_handle:0?functional_1_1_gru_1_1_gru_cell_1_split_readvariableop_resource>functional_1_1_gru_1_1_gru_cell_1_cast_readvariableop_resource@functional_1_1_gru_1_1_gru_cell_1_cast_1_readvariableop_resource*
T
2	*
_lower_using_switch_merge(*
_num_original_outputs	*8
_output_shapes&
$: : : : :����������: : : : *%
_read_only_resource_inputs
*1
body)R'
%functional_1_1_gru_1_1_while_body_196*1
cond)R'
%functional_1_1_gru_1_1_while_cond_195*7
output_shapes&
$: : : : :����������: : : : *
parallel_iterations �
Gfunctional_1_1/gru_1_1/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
9functional_1_1/gru_1_1/TensorArrayV2Stack/TensorListStackTensorListStack%functional_1_1/gru_1_1/while:output:3Pfunctional_1_1/gru_1_1/TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elements
,functional_1_1/gru_1_1/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������x
.functional_1_1/gru_1_1/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: x
.functional_1_1/gru_1_1/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
&functional_1_1/gru_1_1/strided_slice_3StridedSliceBfunctional_1_1/gru_1_1/TensorArrayV2Stack/TensorListStack:tensor:05functional_1_1/gru_1_1/strided_slice_3/stack:output:07functional_1_1/gru_1_1/strided_slice_3/stack_1:output:07functional_1_1/gru_1_1/strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_mask|
'functional_1_1/gru_1_1/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
"functional_1_1/gru_1_1/transpose_1	TransposeBfunctional_1_1/gru_1_1/TensorArrayV2Stack/TensorListStack:tensor:00functional_1_1/gru_1_1/transpose_1/perm:output:0*
T0*,
_output_shapes
:�����������
,functional_1_1/dense_1_1/Cast/ReadVariableOpReadVariableOp5functional_1_1_dense_1_1_cast_readvariableop_resource*
_output_shapes
:	�
*
dtype0�
functional_1_1/dense_1_1/MatMulMatMul/functional_1_1/gru_1_1/strided_slice_3:output:04functional_1_1/dense_1_1/Cast/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������
�
/functional_1_1/dense_1_1/BiasAdd/ReadVariableOpReadVariableOp8functional_1_1_dense_1_1_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0�
 functional_1_1/dense_1_1/BiasAddBiasAdd)functional_1_1/dense_1_1/MatMul:product:07functional_1_1/dense_1_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������
�
functional_1_1/reshape_1/ShapeShape)functional_1_1/dense_1_1/BiasAdd:output:0*
T0*
_output_shapes
::��v
,functional_1_1/reshape_1/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: x
.functional_1_1/reshape_1/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.functional_1_1/reshape_1/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
&functional_1_1/reshape_1/strided_sliceStridedSlice'functional_1_1/reshape_1/Shape:output:05functional_1_1/reshape_1/strided_slice/stack:output:07functional_1_1/reshape_1/strided_slice/stack_1:output:07functional_1_1/reshape_1/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskj
(functional_1_1/reshape_1/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :j
(functional_1_1/reshape_1/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :�
&functional_1_1/reshape_1/Reshape/shapePack/functional_1_1/reshape_1/strided_slice:output:01functional_1_1/reshape_1/Reshape/shape/1:output:01functional_1_1/reshape_1/Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:�
 functional_1_1/reshape_1/ReshapeReshape)functional_1_1/dense_1_1/BiasAdd:output:0/functional_1_1/reshape_1/Reshape/shape:output:0*
T0*+
_output_shapes
:���������|
IdentityIdentity)functional_1_1/reshape_1/Reshape:output:0^NoOp*
T0*+
_output_shapes
:����������
NoOpNoOp0^functional_1_1/dense_1_1/BiasAdd/ReadVariableOp-^functional_1_1/dense_1_1/Cast/ReadVariableOp6^functional_1_1/gru_1_1/gru_cell_1/Cast/ReadVariableOp8^functional_1_1/gru_1_1/gru_cell_1/Cast_1/ReadVariableOp7^functional_1_1/gru_1_1/gru_cell_1/split/ReadVariableOp^functional_1_1/gru_1_1/while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:���������: : : : : 2b
/functional_1_1/dense_1_1/BiasAdd/ReadVariableOp/functional_1_1/dense_1_1/BiasAdd/ReadVariableOp2\
,functional_1_1/dense_1_1/Cast/ReadVariableOp,functional_1_1/dense_1_1/Cast/ReadVariableOp2n
5functional_1_1/gru_1_1/gru_cell_1/Cast/ReadVariableOp5functional_1_1/gru_1_1/gru_cell_1/Cast/ReadVariableOp2r
7functional_1_1/gru_1_1/gru_cell_1/Cast_1/ReadVariableOp7functional_1_1/gru_1_1/gru_cell_1/Cast_1/ReadVariableOp2p
6functional_1_1/gru_1_1/gru_cell_1/split/ReadVariableOp6functional_1_1/gru_1_1/gru_cell_1/split/ReadVariableOp2<
functional_1_1/gru_1_1/whilefunctional_1_1/gru_1_1/while:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
=
inputs3
serving_default_inputs:0���������@
output_04
StatefulPartitionedCall:0���������tensorflow/serving/predict:�"
�
_tracked
_inbound_nodes
_outbound_nodes
_losses
_losses_override
_operations
_layers
_build_shapes_dict
	output_names

	optimizer
_default_save_signature

signatures"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
C
0
1
2
3
4"
trackable_list_wrapper
C
0
1
2
3
4"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
�

_variables
_trainable_variables
 _trainable_variables_indices
_iterations
_learning_rate

_momentums
_velocities"
_generic_user_object
�
trace_02�
__inference_serving_default_309�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *!�
����������ztrace_0
,
serving_default"
signature_map
y
_inbound_nodes
_outbound_nodes
_losses
	_loss_ids
_losses_override"
_generic_user_object
�
 cell
!_inbound_nodes
"_outbound_nodes
#_losses
$	_loss_ids
%_losses_override
&
state_size
'_build_shapes_dict"
_generic_user_object
y
(_inbound_nodes
)_outbound_nodes
*_losses
+	_loss_ids
,_losses_override"
_generic_user_object
�
-_kernel
.bias
/_inbound_nodes
0_outbound_nodes
1_losses
2	_loss_ids
3_losses_override
4_build_shapes_dict"
_generic_user_object
�
5_inbound_nodes
6_outbound_nodes
7_losses
8	_loss_ids
9_losses_override
:_build_shapes_dict"
_generic_user_object
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
:	 (2adam/iteration
: (2adam/learning_rate
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�B�
__inference_serving_default_309inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
1__inference_signature_wrapper_serving_default_325inputs"�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs�

jinputs
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�

;kernel
<recurrent_kernel
=bias
>_inbound_nodes
?_outbound_nodes
@_losses
A	_loss_ids
B_losses_override
C_build_shapes_dict"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
!:	�
2dense_1/kernel
:
2dense_1/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
(:&	�2gru_1/gru_cell/kernel
3:1
��2gru_1/gru_cell/recurrent_kernel
&:$	�2gru_1/gru_cell/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper�
__inference_serving_default_309c=;<-.3�0
)�&
$�!
inputs���������
� "%�"
unknown����������
1__inference_signature_wrapper_serving_default_325=;<-.=�:
� 
3�0
.
inputs$�!
inputs���������"7�4
2
output_0&�#
output_0���������