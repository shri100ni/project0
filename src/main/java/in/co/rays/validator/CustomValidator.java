package in.co.rays.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

// TODO: Auto-generated Javadoc
/**
 * The Class CustomValidator.
 */
public class CustomValidator implements ConstraintValidator<Custom, String>{
	
	/** The regex. */
	private String regex;
	
	/* (non-Javadoc)
	 * @see javax.validation.ConstraintValidator#initialize(java.lang.annotation.Annotation)
	 */
	public void initialize(Custom constraintAnnotation) {
		
		this.regex=constraintAnnotation.regex();	
	}

	/* (non-Javadoc)
	 * @see javax.validation.ConstraintValidator#isValid(java.lang.Object, javax.validation.ConstraintValidatorContext)
	 */
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(value == null||value.toString().trim()==""){
			context.disableDefaultConstraintViolation();
			return true;
		} else if((value!=null||value.toString().trim()!="")&&value.matches(regex)) return true;
        //return false if nothing matches the input
        else return false;
	}

}
