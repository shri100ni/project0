package in.co.rays.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import in.co.rays.dao.MarksheetDAOInt;
import in.co.rays.dto.MarksheetDTO;
import in.co.rays.dto.RoleDTO;
import in.co.rays.exception.DuplicateRecordException;
// TODO: Auto-generated Javadoc

/**
 * The Class MarksheetServiceSpringImpl.
 */
@Service
public class MarksheetServiceSpringImpl implements MarksheetServiceInt{

	/** The dao. */
	@Autowired
	MarksheetDAOInt dao;
	
	/** The log. */
	private static Logger log = Logger.getLogger(MarksheetServiceSpringImpl.class);
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.MarksheetServiceInt#add(in.co.rays.dto.MarksheetDTO)
	 */
	@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = false)
	public long add(MarksheetDTO dto) throws DuplicateRecordException {
		log.debug("MarksheetServiceSpringImpl Add Started");
		
		System.out.println("inside service--------------->");
		MarksheetDTO dtoExist = dao.findByRollNumber(dto.getRollNo());
        if (dtoExist != null) {
            throw new DuplicateRecordException("Role Number already exists");
        }
        long pk = dao.add(dto);
        log.debug("MarksheetServiceSpringImpl Add End");
        return pk;
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.MarksheetServiceInt#update(in.co.rays.dto.MarksheetDTO)
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void update(MarksheetDTO dto) throws DuplicateRecordException {
		log.debug("MarksheetServiceSpringImpl update Started");
    	dao.update(dto);
    	log.debug("MarksheetServiceSpringImpl update End");
		
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.MarksheetServiceInt#delete(long)
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void delete(long id) {
		log.debug("MarksheetServiceSpringImpl delete Start");
   	 dao.delete(id);
   	log.debug("MarksheetServiceSpringImpl delete End");
		
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.MarksheetServiceInt#findByRollNumber(java.lang.String)
	 */
	@Transactional(readOnly = false)
	public MarksheetDTO findByRollNumber(String roleNumber) {
		log.debug("MarksheetServiceSpringImpl findByRollNumber Started");
		MarksheetDTO dto = dao.findByRollNumber(roleNumber);
    	log.debug("MarksheetServiceSpringImpl findByRollNumber End");
    	return dto;
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.MarksheetServiceInt#findById(long)
	 */
	@Transactional(readOnly = false)
	public MarksheetDTO findById(long id) {
		log.debug("MarksheetServiceSpringImpl findById Started");
		MarksheetDTO dto = dao.findByPK(id);
    	log.debug("MarksheetServiceSpringImpl findById End");
    	return dto;
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.MarksheetServiceInt#search(in.co.rays.dto.MarksheetDTO, int, int)
	 */
	@Transactional(readOnly = false)
	public List<MarksheetDTO> search(MarksheetDTO dto, int pageNo, int pageSize) {
		
		return dao.search(dto, pageNo, pageSize);
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.MarksheetServiceInt#search(in.co.rays.dto.MarksheetDTO)
	 */
	@Transactional(readOnly = false)
	public List<MarksheetDTO> search(MarksheetDTO dto) {
		
		return dao.search(dto);
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.MarksheetServiceInt#getMeritList(int, int)
	 */
	@Transactional(readOnly = false)
	public List<MarksheetDTO> getMeritList( int pageNo, int pageSize) {
		
		return dao.search(new MarksheetDTO(), pageNo, pageSize);
	}

}
