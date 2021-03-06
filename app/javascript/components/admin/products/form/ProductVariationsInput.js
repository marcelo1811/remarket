import React from "react"
import PropTypes from "prop-types"
import { Button, Form, Row, Col } from 'react-bootstrap';

class ProductVariationsInput extends React.Component {
	state = {
		productVariants: this.props.product_variants
	}

	_onClickAddVariant = () => {
		let newProductVariants = [...this.state.productVariants, {name: '', price: ''}]

		this.setState({
			productVariants: newProductVariants
		})
	}

	_onChangeVariant = (index, key, value) => {
		let newProductVariants = [...this.state.productVariants]
		let variant = newProductVariants[index]
		variant[key] = value

		this.setState({
			productVariants: newProductVariants
		})
	}

	_onClickRemoveVariant = (index) => {
		let newProductVariants = [...this.state.productVariants]
		delete newProductVariants[index]
		
		this.setState({
			productVariants: newProductVariants.filter(Boolean)
		})
	}

	render () {
		return (
		  <div>
		  {
	  	    this.state.productVariants.map((variant, index) => {
				return (
					<div className='mt-5'>
						<Row className='align-items-center'>
							<Col sm={8}>
								<Form.Group>
									<Form.Label>Variação</Form.Label>
									<Form.Control
										type='text'
										placeholder='ex: Modelo único, Tamanho - G'
										name='product[variants][][name]'
										value={variant.name}
										required
										onChange={(e) => this._onChangeVariant(index, 'name', e.target.value)}
									/>
								</Form.Group>
							</Col>
							<Col sm={2}>
								<Form.Group>
									<Form.Label>Preço</Form.Label>
									<Form.Control
										type='number'
										placeholder='ex: 10,00'
										name='product[variants][][price]'
										value={variant.price}
										required
										onChange={(e) => this._onChangeVariant(index, 'price', e.target.value)}
									/>
								</Form.Group>
							</Col>
							<Col sm={2}>
								{ 
									this.state.productVariants.length > 1 && <Button variant='link' onClick={() => this._onClickRemoveVariant(index)}>Excluir</Button>
								}
							</Col>
							<Form.Control
								type='hidden'
								name='product[variants][][id]'
								value={variant.id}
							/>
						</Row>
				  	</div>
				)
	  	    })

		  }
		  	
		  	<div>
		  		<Button variant='outline-secondary' onClick={() => this._onClickAddVariant()}>Adicionar nova variação</Button>
		  	</div>
		  </div>
		);
	}
}

export default ProductVariationsInput
